//
//  PeriodicTableElementView.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 17.01.2022.
//

import SwiftUI
import PeriodumCore

struct PeriodicTableElementView: View {
    let element: PeriodicTableElementViewModel
    @State private var isHovering = false
    var inverse = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(element.symbol)
                .font(.title)
                .fontWeight(.light)
                .minimumScaleFactor(0.3)
                .layoutPriority(2)
            
            Text(element.nameTr)
                .font(.footnote)
                .foregroundColor(inverse ? .black : .white)
                .layoutPriority(1)
                .minimumScaleFactor(0.8)
                .opacity(0.6)
            
            Text(element.atomicMass)
                .font(.caption)
                .opacity(0.6)
                .minimumScaleFactor(0.1)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .overlay(
            Text("\(element.number)")
                .font(.footnote)
                .opacity(0.6)
                .layoutPriority(1)
                .padding(.vertical, 4)
                .padding(.trailing, 6),
            alignment: .topTrailing
        )
        .foregroundColor(inverse ? .black : color)
        .lineLimit(1)
        .background(
            LinearGradient(
                colors: gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(4)
    }
    
    var color: Color {
        element.color
    }
    
    @inline(__always)
    var gradientColors: [Color] {
        [
            inverse ? color : Color(red: 39/255, green: 47/255, blue: 63/255),
            inverse ? color : Color(red: 29/255, green: 35/255, blue: 47/255)
        ]
    }
}

struct PeriodicTableElementView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            HStack {
                PeriodicTableElementView(element: PeriodicTableElementViewModel(from: previewElements[0]))
                    .frame(width: 85, height: 85)
                
                PeriodicTableElementView(
                    element: PeriodicTableElementViewModel(from: previewElements[0]),
                    inverse: true
                ).frame(width: 85, height: 85)
            }
            
            HStack {
                PeriodicTableElementView(element: PeriodicTableElementViewModel(from: previewElements[1]))
                    .frame(width: 85, height: 85)
                
                PeriodicTableElementView(
                    element: PeriodicTableElementViewModel(from: previewElements[1]),
                    inverse: true
                ).frame(width: 85, height: 85)
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
