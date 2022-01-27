//  Length.swift
//  Created by Umur Gedik on 24.01.2022.

import Foundation

public final class ElementLength: Dimension, ElementDimension {
    public static let pm = ElementLength(symbol: "pm", converter: UnitConverterLinear(coefficient: 1))
    public static let baseUnit = pm
    
    public static let A      = ElementLength(symbol: "A",      converter: UnitConverterLinear(coefficient: 0.01))
    public static let am     = ElementLength(symbol: "am",     converter: UnitConverterLinear(coefficient: 1000000))
    public static let fm     = ElementLength(symbol: "fm",     converter: UnitConverterLinear(coefficient: 1000))
    public static let µm     = ElementLength(symbol: "µm",     converter: UnitConverterLinear(coefficient: 1.00E-06))
    public static let nm     = ElementLength(symbol: "nm",     converter: UnitConverterLinear(coefficient: 0.001))
    public static let mm     = ElementLength(symbol: "mm",     converter: UnitConverterLinear(coefficient: 1.00E-09))
    public static let cm     = ElementLength(symbol: "cm",     converter: UnitConverterLinear(coefficient: 1.00E-10))
    public static let dm     = ElementLength(symbol: "dm",     converter: UnitConverterLinear(coefficient: 1.00E-11))
    public static let dam    = ElementLength(symbol: "dam",    converter: UnitConverterLinear(coefficient: 1.00E-13))
    public static let hm     = ElementLength(symbol: "hm",     converter: UnitConverterLinear(coefficient: 1.00E-14))
    public static let km     = ElementLength(symbol: "km",     converter: UnitConverterLinear(coefficient: 1.00E-15))
    public static let Mm     = ElementLength(symbol: "Mm",     converter: UnitConverterLinear(coefficient: 1.00E-18))
    public static let Gm     = ElementLength(symbol: "Gm",     converter: UnitConverterLinear(coefficient: 1.00E-21))
    public static let Tm     = ElementLength(symbol: "Tm",     converter: UnitConverterLinear(coefficient: 1.00E-24))
    public static let Pm     = ElementLength(symbol: "Pm",     converter: UnitConverterLinear(coefficient: 1.00E-27))
    public static let Em     = ElementLength(symbol: "Em",     converter: UnitConverterLinear(coefficient: 1.00E-30))
    public static let `in`   = ElementLength(symbol: "in",     converter: UnitConverterLinear(coefficient: 3.9370078740157E-11))
    public static let yd     = ElementLength(symbol: "yd",     converter: UnitConverterLinear(coefficient: 1.0936132983377E-12))
    public static let mi     = ElementLength(symbol: "mi",     converter: UnitConverterLinear(coefficient: 6.2137119223733E-16))
    public static let ft     = ElementLength(symbol: "ft",     converter: UnitConverterLinear(coefficient: 3.2808398950131E-12))
    public static let ly     = ElementLength(symbol: "ly",     converter: UnitConverterLinear(coefficient: 1.0570008340247E-28))
    public static let Planck = ElementLength(symbol: "Planck", converter: UnitConverterLinear(coefficient: 6.1879273537329E+22))
    
    public static let elementUnits: [ElementLength] = [pm, A, am, fm, µm, nm, mm, cm, dm, dam, hm, km, Mm, Gm, Tm, Pm, Em, `in`, yd, mi, ft, ly, Planck]
}
