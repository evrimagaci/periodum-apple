//
//  PERTableViewHeaderFooterView.swift
//  SpendLogIOS
//
//  Created by Umur Gedik on 12.01.2022.
//

import UIKit

class PERTableViewHeaderFooterView: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupViewHierarchy() {
        
    }
}

extension UITableView {
    func register<HeaderFooterView: ReusableheaderFooterView>(_ viewType: HeaderFooterView.Type = HeaderFooterView.self) {
        register(HeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderFooterView.reuseIdentifier)
    }
    
    func dequeue<HeaderFooterView: ReusableheaderFooterView>(_ viewType: HeaderFooterView.Type = HeaderFooterView.self) -> HeaderFooterView {
        dequeueReusableHeaderFooterView(withIdentifier: HeaderFooterView.reuseIdentifier) as! HeaderFooterView
    }
}

protocol ReusableheaderFooterView: UITableViewHeaderFooterView { }

extension ReusableheaderFooterView {
    static var reuseIdentifier: String { String(describing: Self.self) }
}

extension PERTableViewHeaderFooterView: ReusableheaderFooterView { }
