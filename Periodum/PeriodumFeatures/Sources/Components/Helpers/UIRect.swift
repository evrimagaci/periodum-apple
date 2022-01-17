//  UIRect.swift
//  OverwatchFanbaseIOS
//  Created by Umur Gedik on 12.01.2022.

import UIKit

struct UIRect: Equatable {
    private(set) var cgRect: CGRect
    private let view: UIView
    private var isLeftToRight: Bool { view.isLeftToRight }
    
    init(_ cgRect: CGRect, in view: UIView) {
        self.cgRect = cgRect
        self.view = view
    }
    
    var leading: CGFloat {
        isLeftToRight ? cgRect.minX : cgRect.maxX
    }
    
    var trailing: CGFloat {
        isLeftToRight ? cgRect.maxX : cgRect.minX
    }
    
    var minY: CGFloat { cgRect.minY }
    var maxY: CGFloat { cgRect.maxY }
    
    var width: CGFloat { cgRect.width }
    var height: CGFloat { cgRect.height }
    
    var size: CGSize {
        get { cgRect.size }
        set { cgRect.size = newValue }
    }
    
    func divided(atDistance distance: CGFloat, from edge: NSDirectionalRectEdge) -> (UIRect, UIRect) {
        let (divided, remaining): (CGRect, CGRect)
        
        switch edge {
        case .top: (divided, remaining) = cgRect.divided(atDistance: distance, from: .minYEdge)
        case .bottom: (divided, remaining) = cgRect.divided(atDistance: distance, from: .maxYEdge)
            
        case .leading where isLeftToRight:
            (divided, remaining) = cgRect.divided(atDistance: distance, from: .minXEdge)
        case .leading:
            (divided, remaining) = cgRect.divided(atDistance: distance, from: .maxXEdge)
            
        case .trailing where isLeftToRight:
            (divided, remaining) = cgRect.divided(atDistance: distance, from: .maxXEdge)
        case .trailing:
            (divided, remaining) = cgRect.divided(atDistance: distance, from: .minXEdge)
            
        default:
            (divided, remaining) = cgRect.divided(atDistance: distance, from: .minXEdge)
        }
        
        return (UIRect(divided, in: view), UIRect(remaining, in: view))
    }
    
    func offsetBy(leading: CGFloat) -> UIRect {
        var rect = cgRect
        if isLeftToRight {
            rect.origin.x += leading
            rect.size.width -= leading
        } else {
            rect.size.width -= leading
        }
        
        return UIRect(rect, in: view)
    }
    
    func insetBy(dx: CGFloat, dy: CGFloat) -> UIRect {
        UIRect(cgRect.insetBy(dx: dx, dy: dy), in: view)
    }
    
    func inset(by insets: NSDirectionalEdgeInsets) -> UIRect {
        let edgeInsets = UIEdgeInsets(
            top: insets.top,
            left: isLeftToRight ? insets.leading : insets.trailing,
            bottom: insets.bottom,
            right: isLeftToRight ? insets.trailing : insets.leading
        )
        
        return UIRect(cgRect.inset(by: edgeInsets), in: view)
    }
    
    func inset(by insets: UIEdgeInsets) -> UIRect {
        UIRect(cgRect.inset(by: insets), in: view)
    }
}

extension UIView {
    var uiBounds: UIRect { UIRect(bounds, in: self) }
    var isLeftToRight: Bool { traitCollection.layoutDirection == .leftToRight }
    
    func setTopLeading(to point: CGPoint, in container: UIRect) {
        if isLeftToRight {
            frame.origin = CGPoint(x: container.leading + point.x, y: point.y)
        } else {
            frame.origin = CGPoint(x: container.leading - point.x - bounds.width, y: point.y)
        }
    }
    
    func setTopTrailing(to point: CGPoint, in container: UIRect) {
        if isLeftToRight {
            frame.origin = CGPoint(x: container.trailing - bounds.width, y: point.y)
        } else {
            frame.origin = CGPoint(x: container.trailing + point.x, y: point.y)
        }
    }
}
