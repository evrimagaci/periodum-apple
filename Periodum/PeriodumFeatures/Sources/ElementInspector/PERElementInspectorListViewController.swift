//  PERElementInspectorListViewController.swift
//  Created by Umur Gedik on 19.01.2022.

import UIKit
import Components

enum Section: Hashable { case main }

class PERElementInspectorListViewController: PERViewController {
    var rows: [PERElementInspectorRow] = [] {
        didSet { rowsDidChange() }
    }
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
    private lazy var dataSource = setupDataSource()
    
    fileprivate let regularCellRegistration = makeRegularCellRegistration()
    fileprivate let groupCellRegistration = makeGroupCellRegistration()
    fileprivate let measurementCellRegistration = makeMeasurementCellRegistration()
    
    // MARK: - Lifecycle
    private func rowsDidChange() {
        let currentSnapshot = dataSource.snapshot(for: .main)
        let expandedRowTitles = currentSnapshot.items.filter(currentSnapshot.isExpanded(_:)).map(\.title)
        
        var snapshot = Snapshot()
        snapshot.append(rows)
        
        for row in rows where !row.children.isEmpty {
            snapshot.append(row.children, to: row)
            if expandedRowTitles.contains(row.title) {
                snapshot.expand([row])
            }
        }
        
        dataSource.apply(snapshot, to: .main, animatingDifferences: true)
    }
    
    // MARK: - View Hieararchy
    public override func loadView() {
        view = collectionView
        collectionView.backgroundColor = .clear
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.allowsSelection = true
    }
    
    
    private func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(44))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}

fileprivate extension PERElementInspectorListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, PERElementInspectorRow>
    typealias Snapshot = NSDiffableDataSourceSectionSnapshot<PERElementInspectorRow>
    
    private func setupDataSource() -> DataSource {
        let regularCell = regularCellRegistration
        let groupCell = groupCellRegistration
        let measurementCell = measurementCellRegistration
        
        return DataSource(collectionView: collectionView) { collectionView, indexPath, inspectorRow in
            if inspectorRow.children.isEmpty {
                if inspectorRow.unit != nil {
                    return collectionView.dequeueConfiguredReusableCell(using: measurementCell, for: indexPath, item: inspectorRow)
                } else {
                    return collectionView.dequeueConfiguredReusableCell(using: regularCell, for: indexPath, item: inspectorRow)
                }
            } else {
                let isExpanded = (collectionView.dataSource as? DataSource)?.snapshot(for: .main).isExpanded(inspectorRow) ?? false
                let cell = collectionView.dequeueConfiguredReusableCell(using: groupCell, for: indexPath, item: inspectorRow)
                cell.isCollapsed = !isExpanded
                return cell
            }
        }
    }

}

// MARK: - Regular Cell Registration
fileprivate extension PERElementInspectorListViewController {
    typealias RegularCell = PERElementInspectorCell
    typealias RegularCellRegistration = UICollectionView.CellRegistration<RegularCell, PERElementInspectorRow>
    
    static func makeRegularCellRegistration() -> RegularCellRegistration {
        RegularCellRegistration { cell, indexPath, item in
            cell.title = item.title
            cell.value = item.value
            cell.isChildCell = item.isChild
        }
    }
}

// MARK: - Group Cell Registration
fileprivate extension PERElementInspectorListViewController {
    typealias GroupCell = PERElementInspectorGroupCell
    typealias GroupCellRegistration = UICollectionView.CellRegistration<GroupCell, PERElementInspectorRow>
    
    static func makeGroupCellRegistration() -> GroupCellRegistration {
        GroupCellRegistration { cell, indexPath, item in
            cell.title = item.title
        }
    }
}

// MARK: - Measurement Cell Registration
fileprivate extension PERElementInspectorListViewController {
    typealias MeasurementCell = PERElementInspectorMeasurementCell
    typealias MeasurementCellRegistration = UICollectionView.CellRegistration<MeasurementCell, PERElementInspectorRow>
    
    static func makeMeasurementCellRegistration() -> MeasurementCellRegistration {
        MeasurementCellRegistration { cell, indexPath, item in
            guard let unit = item.unit, !item.allUnits.isEmpty else {
                fatalError("Invalid inspector row")
            }
            
            cell.title = item.title
            cell.setValue(item.value, unit: unit, allUnits: item.allUnits)
        }
    }
}

// MARK: - UICollectionViewDelegate
extension PERElementInspectorListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        guard let row = dataSource.itemIdentifier(for: indexPath) else { return }
        
        if !row.children.isEmpty, let cell = collectionView.cellForItem(at: indexPath) as? GroupCell {
            var snapshot: Snapshot = dataSource.snapshot(for: .main)
            if snapshot.isExpanded(row) {
                snapshot.collapse([row])
                cell.isCollapsed = true
            } else {
                snapshot.expand([row])
                cell.isCollapsed = false
            }
            
            dataSource.apply(snapshot, to: .main)
        }
    }
}
