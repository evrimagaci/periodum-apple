//  PERTableViewCell.swift
//  SpendLogIOS
//  Created by Umur Gedik on 12.01.2022.

import UIKit

class PERTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupViewHierarchy() {
        
    }
}

protocol ReusableCell: PERTableViewCell { }

extension ReusableCell {
    static var reuseIdentifier: String { String(describing: Self.self) }
}

extension PERTableViewCell: ReusableCell { }

extension UITableView {
    func register<Cell: ReusableCell>(_ type: Cell.Type = Cell.self) {
        register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func dequeueCell<Cell: ReusableCell>(_ type: Cell.Type = Cell.self, for indexPath: IndexPath) -> Cell {
        dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as! Cell
    }
}
