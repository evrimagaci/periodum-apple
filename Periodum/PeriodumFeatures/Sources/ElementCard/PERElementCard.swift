//  PERElementCard.swift
//  Created by Umur Gedik on 17.01.2022.

import SwiftUI
import PeriodumCore
import PlatformHelpers

public struct PERElementCard: View {
    public let element: PERElementCardModel
    public let inverse: Bool
    
    public init(element: PERElementCardModel, inverse: Bool = false) {
        self.element = element
        self.inverse = inverse
    }
    
    @State private var isHovering = false
    
    public var body: some View {
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
        .foregroundColor(inverse ? .black : Color(hex: element.colorCode))
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
    
    @inline(__always)
    private var gradientColors: [Color] {
        [
            inverse ? Color(hex: element.colorCode) : Color(red: 39/255, green: 47/255, blue: 63/255),
            inverse ? Color(hex: element.colorCode) : Color(red: 29/255, green: 35/255, blue: 47/255)
        ]
    }
}

struct PeriodicTableElementView_Previews: PreviewProvider {
    static let hydrogen = PERElementCardModel(
        number: 1,
        symbol: "H",
        nameTr: "Hidrojen",
        atomicMass: "1.008",
        colorCode: ElementStyle.Kind.nonMetallic.colorCode,
        row: 1,
        col: 1
    )
    
    static let helium = PERElementCardModel(
        number: 2,
        symbol: "He",
        nameTr: "Helyum",
        atomicMass: "4.0026022",
        colorCode: ElementStyle.Kind.nobleGas.colorCode,
        row: 1,
        col: 18
    )
    
    static var previews: some View {
        Group {
            HStack {
                PERElementCard(element: hydrogen)
                    .frame(width: 85, height: 85)
                
                PERElementCard(element: hydrogen, inverse: true)
                    .frame(width: 85, height: 85)
            }
            
            HStack {
                PERElementCard(element: helium)
                    .frame(width: 85, height: 85)
                
                PERElementCard(element: helium, inverse: true)
                    .frame(width: 85, height: 85)
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
