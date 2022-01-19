//  UIRect.swift
//  OverwatchFanbaseIOS
//  Created by Umur Gedik on 12.01.2022.

import UIKit

public struct UIRect: Equatable {
    public private(set) var cgRect: CGRect
    private let view: UIView
    private var isLeftToRight: Bool { view.isLeftToRight }
    
    public init(_ cgRect: CGRect, in view: UIView) {
        self.cgRect = cgRect
        self.view = view
    }
    
    public var leading: CGFloat {
        isLeftToRight ? cgRect.minX : cgRect.maxX
    }
    
    public var trailing: CGFloat {
        isLeftToRight ? cgRect.maxX : cgRect.minX
    }
    
    public var topLeading: CGPoint {
        CGPoint(x: leading, y: minY)
    }
    
    public var topTrailing: CGPoint {
        CGPoint(x: trailing, y: minY)
    }
    
    public var minY: CGFloat { cgRect.minY }
    public var maxY: CGFloat { cgRect.maxY }
    
    public var width: CGFloat { cgRect.width }
    public var height: CGFloat { cgRect.height }
    
    public var size: CGSize {
        get { cgRect.size }
        set { cgRect.size = newValue }
    }
    
    public func divided(atDistance distance: CGFloat, from edge: NSDirectionalRectEdge) -> (UIRect, UIRect) {
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
    
    public func offsetBy(leading: CGFloat) -> UIRect {
        var rect = cgRect
        if isLeftToRight {
            rect.origin.x += leading
            rect.size.width -= leading
        } else {
            rect.size.width -= leading
        }
        
        return UIRect(rect, in: view)
    }
    
    public func insetBy(dx: CGFloat, dy: CGFloat) -> UIRect {
        UIRect(cgRect.insetBy(dx: dx, dy: dy), in: view)
    }
    
    public func inset(by insets: NSDirectionalEdgeInsets) -> UIRect {
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
    public var uiBounds: UIRect { UIRect(bounds, in: self) }
    var isLeftToRight: Bool { traitCollection.layoutDirection == .leftToRight }
    
    public func setTopLeading(to point: CGPoint, in container: UIRect) {
        if isLeftToRight {
            frame.origin = CGPoint(x: container.leading + point.x, y: container.minY + point.y)
        } else {
            frame.origin = CGPoint(x: container.leading - point.x - bounds.width, y: container.minY + point.y)
        }
    }
    
    public func setTopTrailing(to point: CGPoint, in container: UIRect) {
        if isLeftToRight {
            frame.origin = CGPoint(x: container.trailing - bounds.width, y: container.minY + point.y)
        } else {
            frame.origin = CGPoint(x: container.trailing + point.x, y: container.minY + point.y)
        }
    }
}
