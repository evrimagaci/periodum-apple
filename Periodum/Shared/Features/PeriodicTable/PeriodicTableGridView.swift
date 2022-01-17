//
//  PeriodicTableGridView.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 17.01.2022.
//

import Foundation
import SwiftUI

import PeriodumCore

struct PeriodicTableGridView: View {
    let elements: [PeriodicTableElementViewModel]
    @Binding var selection: Element.ID?
    
    let numRows = 9
    let numCols = 18
    var body: some View {
        GeometryReader { geom in
            let elementSize = self.elementSize(from: geom)
            ZStack(alignment: .topLeading) {
                ForEach(elements) { element in
                    PeriodicTableElementView(element: element)
                        .padding([.trailing, .bottom], 5)
                        .frame(
                            width: elementSize.width,
                            height: elementSize.width
                        )
                        .onTapGesture {
                            selection = element.id
                        }
                        .alignmentGuide(.top) { d in -CGFloat(element.row) * elementSize.height }
                        .alignmentGuide(.leading) { d in -CGFloat(element.col) * elementSize.width }
                }
            }
        }
        .padding([.top, .leading], 5)
        .frame(minWidth: 400, minHeight: 400)
    }
    
    func elementPosition(from element: Element) -> (row: Int, col: Int)? {
        guard let row = element.ypos, let col = element.xpos else { return nil }
        return (row, col)
    }
    
    func elementSize(from geom: GeometryProxy) -> CGSize {
        let bounds = geom.size
        let lengthByWidth = bounds.width / CGFloat(numCols)
        let lengthByHeight = bounds.height / CGFloat(numRows)
        
        if lengthByWidth * CGFloat(numRows) >= bounds.height {
            return CGSize(width: lengthByHeight, height: lengthByHeight)
        } else {
            return CGSize(width: lengthByWidth, height: lengthByWidth)
        }
    }
}

struct PeriodicTableGridView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodicTableGridView(
            elements: previewElements.map(PeriodicTableElementViewModel.init(from:)),
            selection: .constant(nil)
        )
        .padding()
        .previewLayout(.fixed(width: 1000, height: 1400))
    }
}
