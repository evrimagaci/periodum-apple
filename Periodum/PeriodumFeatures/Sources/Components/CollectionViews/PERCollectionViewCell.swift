//  PERCollectionViewCell.swift
//  Created by Umur Gedik on 19.01.2022.

import UIKit

open class PERCollectionViewCell: UICollectionViewCell {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init?(coder:) has not been implemented")
    }
    
    open func setupViewHierarchy() {
        
    }
}
