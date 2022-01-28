//  PERElementInspectorViewController.swift
//  Created by Umur Gedik on 17.01.2022.

import UIKit
import SwiftUI

import PeriodumCore
import Components
import ElementCard

public class PERElementInspectorViewController: PERViewController {
    public var element: Element {
        didSet {
            if isViewLoaded {
                renderElement()
            }
        }
    }
    
    private let onDismiss: () -> Void
    // MARK: - Lifecycle
    public init(element: Element, onDismiss: @escaping () -> Void) {
        self.element = element
        self.onDismiss = onDismiss
        super.init()
    }
    
    private func renderElement() {
        let rows: [PERElementInspectorRow] = [
            .regular("Turkce Isim:", value: element.nameTr),
            .regular("Ingilizce Isim:", value: element.nameEn),
            .regular("Sembol:", value: element.symbol),
            .regular("Atom Numarasi:", value: String(element.number)),
            .regular("Gaz Fazi:", value: String(element.gasPhase)),
            .regular("Allotrop İsimleri:", value: element.allotropeNames),
            .regular("Görünüm:", value: element.appearance),
            .regular("Kırılma İndisi:", value: element.refractiveIndex),
            .group("Tanimlayici Numaralar:", children: [
                .regular("CAS Numarasi:", value: element.casNumber),
                .regular("CID Numarasi:", value: element.cidNumber),
                .regular("DOT Numarasi:", value: element.dotNumber),
                .regular("RTECS Numarasi:", value: element.rtecsNumber),
                .regular("Mendeleev Numarasi:", value: element.mendeleevNumber.map(String.init) ?? "")
            ]),
            .group("Kutle", children: [
                .measurement("Atomik Kutle:", value: element.atomicMass, unit: UnitMass.daltons),
                .measurement("Atomik Kutle Blirsizligi:", value: element.atomicMassUncertainty, unit: UnitMass.daltons)
            ]),
            .group("Koordinatlar", children: [
                .regular("x Pozisyonu:", value: element.xpos.map(String.init) ?? ""),
                .regular("y Pozisyonu:", value: element.ypos.map(String.init) ?? ""),
                .regular("Periyot:", value: element.period.map(String.init) ?? ""),
                .regular("Grup:", value: element.group)
            ]),
            .group("Siniflandirma", children: [
                .regular("Blok:", value: element.block),
                .regular("Kategori:", value: element.category),
                .regular("Elektrik Tipi:", value: element.electricalType),
                .regular("Jeokimyasal Sinif:", value: element.geochemicalClass),
                .regular("Goldschmidt Sinifi:", value: element.goldschmidtClass)
            ]),
            .group("Bulunma Sikligi", children: [
                .measurement("Sehir Topraginda Bulunnma Sikligi:", value: element.abundanceUrbanSoil, unit: UnitMass.kilograms),
                .measurement("Deniz Suyunda Bulunma Sikligi:", value: element.abundanceSeawaterW1, unit: UnitConcentrationMass.kilogramsPerLiter),
                .regular("Guneste Bulunma Sikligi:", value: element.abundanceSunS1),
                .regular("Dunya Kabugunda Bulunma Sikligi:", value: element.abundanceInEarthCrustC1),
                .regular("Gunes Sisteminde Bulunma Sikligi:", value: element.abundanceSolarSystemY1),
                .regular("Meteoritlerde Bulunma Sikligi:", value: element.abundanceMeteorite)
            ]),
            .group("Renk", children: [
                .regular("Jmol:", value: element.jmolColor),
                .regular("MOLCAS GV:", value: element.molcasGvColor),
                .regular("CPK:", value: element.cpkColor)
            ]),
            .group("Atomik Yaricap", children: [
                .regular("Deneysel Olcum:", value: element.atomicRadiusEmpirical),
                .regular("Hesaplanmis Olcum:", value: element.atomicRadiusCalculated),
                .regular("Van Der Waals Yaricapi:", value: element.atomicRadiusVanderwaals),
                .regular("Bondi:", value: element.vdwRadiusBondi),
                .regular("Ruhlar:", value: element.vdwRadiusTruhlar),
                .regular("Oda Sicakliginda:", value: element.vdwRadiusRt),
                .regular("Rahm:", value: element.atomicRadiusRahm),
                .regular("Batsanov:", value: element.vdwRadiusBatsanov),
                .regular("Dreiding:", value: element.vdwRadiusDreiding),
                .regular("Uff:", value: element.vdwRadiusUff),
                .regular("mm3:", value: element.vdwRadiusMm3),
                .regular("Alvarez:", value: element.vdwRadiusAlvarez),
                .regular("Kovalent (Bragg):", value: element.covalentRadiusBragg),
                .regular("Kovalent (Tek Bag):", value: element.atomicRadiusCovalentSingleBond),
                .regular("Kovalent (Uclu Bag):", value: element.atomicRadiusCovalentTripleBond),
                .regular("Kovalent (Cordero):", value: element.covalentRadiusCordero),
                .regular("Kovalent (Pyykko):", value: element.covalentRadiusPyykko.map(String.init) ?? ""),
                .regular("Kovalent (Pyykko, Cift):", value: element.covalentRadiusPyykkoDouble),
                .regular("Kovalent (Pyykko, Uclu):", value: element.covalentRadiusPyykkoTriple),
                .regular("Mendeleev:", value: element.metallicRadiusMendeleev),
                .regular("C12:", value: element.metallicRadiusC12),
                .regular("Metalik:", value: element.atomicRadiusMetallic)
            ]),
            .group("Sicaklik Ozellikleri", children: [
                .measurement("Erime/Donma Sicakligi:", value: element.meltUse, unit: UnitTemperature.kelvin),
                .measurement("Kaynama/Yogunlasma Sicakligi:", value: element.boilUse, unit: UnitTemperature.kelvin),
                .measurement("Curie Noktasi:", value: element.curiePoint, unit: UnitTemperature.kelvin),
                .measurement("Kritik Sicaklik:", value: element.criticalTemperature, unit: UnitTemperature.kelvin),
                .measurement("Tutusma Noktasi:", value: element.flashpoint, unit: UnitTemperature.kelvin),
                .measurement("Superiletken Noktasi:", value: element.superconductingPoint, unit: UnitTemperature.kelvin),
                .measurement("Ototutusma Noktasi:", value: element.autoignitionPoint, unit: UnitTemperature.kelvin),
                .measurement("Kritik Basinc:", value: element.criticalPressure, unit: UnitPressure.megapascals)
            ]),
            .group("Yogunluk Ozellikleri", children: [
                .measurement("Kati Yogunlugu:", value: element.densitySolidWEL, unit: UnitConcentrationMass.kilogramsPerCubicMeter),
                .measurement("Yogunluk (NSA):", value: element.densityRt, unit: UnitConcentrationMass.gramsPerCubicCentimeter),
                .measurement("Sivi Yogunlugu:", value: element.densityLiquidCr2, unit: UnitConcentrationMass.kilogramsPerCubicMeter),
                .measurement("Gaz Yogunlugu:", value: element.densityGas, unit: UnitConcentrationMass.kilogramsPerCubicMeter)
            ]),
            .group("Isi Ozellikleri", children: [
                .measurement("Molar Hacim:", value: element.molarVolume, unit: UnitMolarVolume.cubicCentimetersPerMol),
                .measurement("Atomik Hacim:", value: element.atomicVolume, unit: UnitVolume.cubicCentimeters),
                .measurement("Fuzyon Isisi:", value: element.heatOfFusionCRC, unit: UnitEnergyPerMole.kilojoulePerMole),
                .measurement("Buharlasma Isisi:", value: element.evaporationHeat, unit: UnitEnergyPerMole.kilojoulePerMole),
                .measurement("Yanma Isisi:", value: element.heatOfCombustion, unit: UnitEnergyPerMole.kilojoulePerMole),
                .measurement("Molar Isi:", value: element.molarHeat, unit: SpecificHeatUnit.baseUnit()),
                .measurement("Spesifik Isi Kapasitesi:", value: element.specificHeatCapacity, unit: SpecificHeatCapacityUnit.baseUnit()),
                .measurement("Spesifik Isi:", value: element.specificHeatCRC, unit: SpecificHeatUnit.baseUnit()),
                .measurement("Termal Iletkenlik:", value: element.thermalConductivity, unit: ThermalConductivityUnit.baseUnit()),
                .measurement("Termal Genlesme:", value: element.thermalExpansion, unit: ThermalExpansionUnit.baseUnit()),
                .regular("Abiyabatik Indis:", value: element.adiabaticIndex)
            ]),
            .group("Ses Hizi Ozellikleri", children: [
                .measurement("Uzunlamasina:", value: element.speedOfSoundLongitudinal, unit: UnitSpeed.metersPerSecond),
                .measurement("Enine:", value: element.speedOfSoundTransversal, unit: UnitSpeed.metersPerSecond),
                .measurement("Ekstensiyonel:", value: element.speedOfSoundExtensional, unit: UnitSpeed.metersPerSecond),
                .measurement("Akiskan Icinde:", value: element.speedOfSoundFluid, unit: UnitSpeed.metersPerSecond)
            ]),
            .group("Elektriksel Direnc:", children: [
                .measurement("80 K", value: element.electricalResistivity80K, unit: ResistivityUnit.baseUnit()),
                .measurement("273 K", value: element.electricalResistivity273K, unit: ResistivityUnit.baseUnit()),
                .measurement("293 K", value: element.electricalResistivity293K, unit: ResistivityUnit.baseUnit()),
                .measurement("298 K", value: element.electricalResistivity298K, unit: ResistivityUnit.baseUnit()),
                .measurement("300 K", value: element.electricalResistivity300K, unit: ResistivityUnit.baseUnit()),
                .measurement("500 K", value: element.electricalResistivity500K, unit: ResistivityUnit.baseUnit()),
            ]),
            .group("Manyetik Ozellikler", children: [
                .regular("Manyetik Siralama:", value: element.magneticOrdering),
                .regular("Neel Noktasi:", value: element.neelPoint),
                .regular("Manyetik Duyarlilik:", value: element.magneticSusceptibility)
            ]),
            .group("Elastik Ozellikler", children: [
                .measurement("Kesme Modulu:", value: element.shearModulus, unit: UnitPressure.gigapascals),
                .measurement("Esneklik Modulu:", value: element.bulkModulus, unit: UnitPressure.gigapascals),
                .regular("Poisson Orani:", value: element.poissonRatio),
                .measurement("Young Modulu:", value: element.youngsModulus, unit: UnitPressure.gigapascals)
            ]),
            .group("Sertlik", children: [
                .regular("Mohs Sertligi:", value: element.mohsHardness),
                .regular("Brinell Sertligi:", value: element.brinellHardness),
                .regular("Vickers Sertligi:", value: element.vickersHardness)
            ]),
            .group("Etimolojik Ozellikleri", children: [
                .regular("Tanim:", value: element.welcomeDescription),
                .regular("Orijinal Kelime Dili:", value: element.languageOfOrigin),
                .regular("Kelimenin Kokeni:", value: element.originOfWord),
                .regular("Orijinal Kelime:", value: element.originalWord),
                .regular("Anlam Kelime:", value: element.meaning),
                .regular("Sembolun Kokeni:", value: element.symbolOrigin),
                .regular("Etimolojik Tanim:", value: element.etymologicalDescription)
            ]),
            .group("Kesif & Izolasyon Ozellikleri", children: [
                .regular("Gozleyen / Ongoren:", value: element.observedPredictedBy),
                .regular("Gozlem / Kesif Yili:", value: element.observationOrDiscoveryYear),
                .regular("Kesif Yeri:", value: element.discoveryLocation),
                .regular("Ilk Ornegi Toplayan:", value: element.isolatedSampledBy),
                .regular("Ilk Ornek Yili:", value: element.isolationSampleYear),
                .regular("Isimlendiren:", value: element.namedBy)
            ]),
            .group("Uretim & Kullanim", children: [
                .regular("Uretim:", value: element.sources),
                .regular("Kullanim Alanlari:", value: element.uses)
            ]),
            .group("Radyoaktif Ozellikleri", children: [
                .regular("Radyoaktivite:", value: element.isRadioactive == 1 ? "Evet" : "Hayir"),
                .regular("Bozunma Modu:", value: element.decayMode),
                .regular("Yari Omur:", value: element.halfLife),
                .regular("Omur:", value: element.lifetime),
                .regular("Notron Kutle Emilimi:", value: element.neutronMassAbsorption),
                .regular("Notron Kesiti:", value: element.neutronCrossSection),
                .regular("Proton Ilgisi:", value: element.protonAffinity)
            ]),
            .group("Elektron Ilgisi", children: [
                .measurement("Elektron Ilgisi:", value: element.electronAffinityEV, unit: UnitEnergyPerMole.electronVolts),
                .measurement("Elektron Ilgisi:", value: element.electronAffinityKJmol, unit: UnitEnergyPerMole.kilojoulePerMole)
            ]),
            .group("Dipol Kutuplanabilirligi", children: [
                .regular("Kabul Edilen:", value: element.dipolePolarizability),
                .regular("Belirsizlik:", value: element.dipolePolarizabilityUNC),
                .regular("C6 GB:", value: element.c6GB),
                .regular("C6 Katsayisi:", value: element.c6Coeff)
            ]),
            .group("Kafes Ozellikleri", children: [
                .regular("Kafes Sabiti Ic Yaricapi:", value: element.latticeConstantInternalDefaultRadii),
                .regular("Kafes Sabitleri:", value: element.latticeConstant),
                .regular("Kafes Yapisi:", value: element.latticeStructure),
                .regular("Kafes Acilari:", value: element.latticeAngles)
            ]),
            .group("Elektron & Kuantum Ozellikleri", children: [
                .regular("Oksidasyon Durumlari:", value: element.oxidationStates),
                .regular("Elektron Konfigurasyonu:", value: element.electronConfiguration),
                .regular("Elektron Konfigurasyonu (Semantik):", value: element.electronConfigurationSemantic),
                .regular("Kuantum Sayisi:", value: element.quantumNumber),
            ] + element.shells.enumerated().map { i, shell in
                PERElementInspectorRow.regular("Kabuk \(i):", value: shell.map(String.init) ?? "")
            } + element.ionizationEnergies.enumerated().map { i , energy in
                PERElementInspectorRow.regular("Iyonizasyon Enerjisi \(i):", value: energy)
            }),
        ]
        
        #warning("FIXME: Isotopes are missing")
        
        listViewController.rows = rows
        headerViewController.element = element
    }
    
    // MARK: - View Hierarchy
    private lazy var backgroundBlur = UIVisualEffectView(effect: UIBlurEffect(style: .systemThickMaterial))
    private lazy var listViewController = PERElementInspectorListViewController()
    private lazy var headerViewController = PERElementInspectorHeaderViewController(element: element, onDismiss: onDismiss)
    
    public override func loadView() {
        view = backgroundBlur
        
        add(headerViewController, parentView: backgroundBlur.contentView)
        add(listViewController, parentView: backgroundBlur.contentView)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let (headerRect, listRect) = view.bounds.divided(atDistance: headerViewController.view.bounds.height, from: .minYEdge)
        headerViewController.view.frame = headerRect
        listViewController.view.frame = listRect
    }
}

#if DEBUG
import SwiftUI
import PeriodumCore

struct ElementInspectorView_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview(
            make: PERElementInspectorViewController(
                element: previewHeliumElement,
                onDismiss: { }
            )
        )
    }
}
#endif
