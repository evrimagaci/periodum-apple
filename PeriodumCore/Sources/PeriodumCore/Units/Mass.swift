//  Mass.swift
//  Created by Umur Gedik on 23.01.2022.

import Foundation

extension UnitMass: ElementDimension {
    public static let daltons         = UnitMass(symbol: "da",        converter: UnitConverterLinear(coefficient: 1.66053E-27))
    public static let atomicMassUnit  = UnitMass(symbol: "akb",       converter: UnitConverterLinear(coefficient: 1.660540199E-27))
    public static let tons            = metricTons
    public static let longTons        = UnitMass(symbol: "uzun ton",  converter: UnitConverterLinear(coefficient: 1016.0469088))
    public static let libre           = pounds
    public static let ons             = ounces
    public static let attograms       = UnitMass(symbol: "ag",        converter: UnitConverterLinear(coefficient: 1e-21))
    public static let femtograms      = UnitMass(symbol: "fg",        converter: UnitConverterLinear(coefficient: 1e-18))
    public static let dekagrams       = UnitMass(symbol: "dag",       converter: UnitConverterLinear(coefficient: 1.6605300000013E-25))
    public static let hectograms      = UnitMass(symbol: "hg",        converter: UnitConverterLinear(coefficient: 0.1))
    public static let megagrams       = UnitMass(symbol: "Mg",        converter: UnitConverterLinear(coefficient: 1000))
    public static let gigagrams       = UnitMass(symbol: "Gg",        converter: UnitConverterLinear(coefficient: 1000000))
    public static let teragrams       = UnitMass(symbol: "Tg",        converter: UnitConverterLinear(coefficient: 1000000000))
    public static let petagrams       = UnitMass(symbol: "Pg",        converter: UnitConverterLinear(coefficient: 1000000000000))
    public static let exagrams        = UnitMass(symbol: "Eg",        converter: UnitConverterLinear(coefficient: 1000000000000000))
    
    public static let elementUnits: [UnitMass] = [
        daltons, atomicMassUnit, tons, longTons, libre,
        ons, attograms, femtograms, dekagrams, hectograms,
        megagrams, gigagrams, teragrams, petagrams, exagrams
    ]
}
