//  Pressure.swift
//  Created by Umur Gedik on 24.01.2022.

import Foundation

public extension UnitPressure {
    static let pascals                      = newtonsPerMetersSquared
    static let atmospheric                  = UnitPressure(symbol: "atm",  converter: UnitConverterLinear(coefficient: 101325))
    static let attopascals                  = UnitPressure(symbol: "aPa",  converter: UnitConverterLinear(coefficient: 9.999999999e-19))
    static let femtopascals                 = UnitPressure(symbol: "fPa",  converter: UnitConverterLinear(coefficient: 1e-15))
    static let picopascals                  = UnitPressure(symbol: "pPa",  converter: UnitConverterLinear(coefficient: 1e-12))
    static let nanopascals                  = UnitPressure(symbol: "nPa",  converter: UnitConverterLinear(coefficient: 1e-9))
    static let micropascals                 = UnitPressure(symbol: "µPa",  converter: UnitConverterLinear(coefficient: 0.000001))
    static let millipascals                 = UnitPressure(symbol: "mPa",  converter: UnitConverterLinear(coefficient: 0.001))
    static let centipascals                 = UnitPressure(symbol: "cPa",  converter: UnitConverterLinear(coefficient: 0.01))
    static let decipascals                  = UnitPressure(symbol: "dPa",  converter: UnitConverterLinear(coefficient: 0.1))
    static let dekapascals                  = UnitPressure(symbol: "daPa", converter: UnitConverterLinear(coefficient: 10))
    static let terapascals                  = UnitPressure(symbol: "TPa",  converter: UnitConverterLinear(coefficient: 1000000000000))
    static let petapascals                  = UnitPressure(symbol: "PPa",  converter: UnitConverterLinear(coefficient: 1000000000000000))
    static let exapascals                   = UnitPressure(symbol: "EPa",  converter: UnitConverterLinear(coefficient: 1000000000000000000))
    
    static let kilopoundsForcePerSquareInch = UnitPressure(symbol: "ksi",  converter: UnitConverterLinear(coefficient: 6.895e+6))
    
    static let elementUnits: [UnitPressure] = [
        pascals, kilopascals, bars, poundsForcePerSquareInch, kilopoundsForcePerSquareInch, atmospheric,
        attopascals, femtopascals, picopascals, nanopascals, micropascals, millipascals,
        centipascals, decipascals, dekapascals, hectopascals, gigapascals, terapascals,
        petapascals, exapascals
    ]
}
