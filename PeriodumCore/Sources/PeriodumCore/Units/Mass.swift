//  Mass.swift
//  Created by Umur Gedik on 23.01.2022.

import Foundation

public extension UnitMass {
    static let daltons         = UnitMass(symbol: "da",        converter: UnitConverterLinear(coefficient: 1.66053E-27))
    static let atomicMassUnit  = UnitMass(symbol: "akb",       converter: UnitConverterLinear(coefficient: 1.660540199E-27))
    static let tons            = metricTons
    static let longTons        = UnitMass(symbol: "uzun ton",  converter: UnitConverterLinear(coefficient: 1016.0469088))
    static let libre           = pounds
    static let ons             = ounces
    static let attograms       = UnitMass(symbol: "ag",        converter: UnitConverterLinear(coefficient: 1e-21))
    static let femtograms      = UnitMass(symbol: "fg",        converter: UnitConverterLinear(coefficient: 1e-18))
    static let dekagrams       = UnitMass(symbol: "dag",       converter: UnitConverterLinear(coefficient: 1.6605300000013E-25))
    static let hectograms      = UnitMass(symbol: "hg",        converter: UnitConverterLinear(coefficient: 0.1))
    static let megagrams       = UnitMass(symbol: "Mg",        converter: UnitConverterLinear(coefficient: 1000))
    static let gigagrams       = UnitMass(symbol: "Gg",        converter: UnitConverterLinear(coefficient: 1000000))
    static let teragrams       = UnitMass(symbol: "Tg",        converter: UnitConverterLinear(coefficient: 1000000000))
    static let petagrams       = UnitMass(symbol: "Pg",        converter: UnitConverterLinear(coefficient: 1000000000000))
    static let exagrams        = UnitMass(symbol: "Eg",        converter: UnitConverterLinear(coefficient: 1000000000000000))
    
    static let elementUnits: [UnitMass] = [
        daltons, atomicMassUnit, tons, longTons, libre,
        ons, attograms, femtograms, dekagrams, hectograms,
        megagrams, gigagrams, teragrams, petagrams, exagrams
    ]
}
