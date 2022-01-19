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
    fileprivate let cellRegistration = makeCellRegistration()
    
    // MARK: - Lifecycle
    private func rowsDidChange() {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(rows, toSection: .main)
        dataSource.apply(snapshot)
    }
    
    // MARK: - View Hieararchy
    public override func loadView() {
        view = collectionView
        collectionView.backgroundColor = .clear
        collectionView.dataSource = dataSource
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
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, PERElementInspectorRow>
    
    private func setupDataSource() -> DataSource {
        DataSource(
            collectionView: collectionView,
            cellProvider: cellRegistration.cellProvider
        )
    }

}

fileprivate extension PERElementInspectorListViewController {
    typealias Cell = PERElementInspectorCell
    typealias CellRegistration = UICollectionView.CellRegistration<Cell, PERElementInspectorRow>
    
    static func makeCellRegistration() -> CellRegistration {
        CellRegistration { cell, indexPath, item in
            cell.title = item.title
            cell.value = item.value
        }
    }
}
