//  Element.swift
//  Created by Umur Gedik on 16.01.2022.

import Foundation

public struct Element: Codable, Identifiable, Equatable {
    public var id: Int { number }

    public let number: Int
    public let nameTr, nameEn, alternateName, symbol: String
    public let casNumber, cidNumber, dotNumber, rtecsNumber: String
    public let mendeleevNumber: Int?
    public let pettiforNumber: Int?
    public let euNumber, spaceGroupNumber: String
    public let glaweNumber: Int?
    public let atomicMass, atomicMassUncertainty: String
    public let xpos: Int?
    public let ypos: Int?
    public let period: Int?
    public let group, block, category, electricalType: String
    public let geochemicalClass, goldschmidtClass, gasPhase, allotropeNames: String
    public let appearance, abundanceInEarthCrustC1, abundanceInEarthCrustC2, abundanceInEarthCrustC3: String
    public let abundanceInEarthCrustC4, abundanceInEarthCrustC5, abundanceInEarthCrustC6, abundanceInEarthCrustU1: String
    public let abundanceInEarthCrustU2, abundanceUrbanSoil, abundanceMeteorite, abundanceSeawaterW1: String
    public let abundanceSeawaterW2, abundanceHumans, abundanceInHumans2, abundanceSunS1: String
    public let abundanceSolarSystemY1, abundanceSolarSystemY2, atomicRadiusEmpirical, atomicRadiusCalculated: String
    public let atomicRadiusVanderwaals, vdwRadiusBondi, vdwRadiusTruhlar, vdwRadiusRt: String
    public let atomicRadiusRahm, vdwRadiusBatsanov, vdwRadiusDreiding, vdwRadiusUff: String
    public let vdwRadiusMm3, vdwRadiusAlvarez, covalentRadiusBragg, atomicRadiusCovalentSingleBond: String
    public let atomicRadiusCovalentTripleBond, covalentRadiusCordero: String
    public let covalentRadiusPyykko: Int?
    public let covalentRadiusPyykkoDouble, covalentRadiusPyykkoTriple, metallicRadiusMendeleev, metallicRadiusC12: String
    public let atomicRadiusMetallic, jmolColor, molcasGvColor, cpkColor: String
    public let refractiveIndex, phaseAtStp, meltUse, meltWEL: String
    public let meltCRC, meltLNG, boilUse, boilWEL: String
    public let boilCRC, boilLNG, boilZhang, curiePoint: String
    public let criticalTemperature, flashpoint, superconductingPoint, autoignitionPoint: String
    public let criticalPressure, densityRt, densitySolidWEL, densitySolidLNG: String
    public let densitySolidCRC, densityLiquidCr2, densityGas, molarVolume: String
    public let atomicVolume, enthalpyOfFusion, heatOfFusionCRC, heatOfFusionLng: String
    public let heatOfFusionWel, evaporationHeat, heatOfVaporizationCRC, heatOfVaporizationLng: String
    public let heatOfVaporizationWel, heatOfVaporizationZhang, heatOfCombustion, molarHeat: String
    public let specificHeatCapacity, specificHeatCRC, specificHeatWel, specificHeatLng: String
    public let thermalConductivity, thermalExpansion, adiabaticIndex, speedOfSoundLongitudinal: String
    public let speedOfSoundTransversal, speedOfSoundExtensional, speedOfSoundFluid, electricalResistivity80K: String
    public let electricalResistivity273K, electricalResistivity293K, electricalResistivity298K, electricalResistivity300K: String
    public let electricalResistivity500K, magneticOrdering, neelPoint, magneticSusceptibility: String
    public let shearModulus, bulkModulus, poissonRatio, youngsModulus: String
    public let mohsHardness, brinellHardness, vickersHardness, welcomeDescription: String
    public let languageOfOrigin, originOfWord, originalWord, meaning: String
    public let symbolOrigin, etymologicalDescription, observedPredictedBy, observationOrDiscoveryYear: String
    public let discoveryLocation, isolatedSampledBy, isolationSampleYear, namedBy: String
    public let sources, uses: String
    public let spectralImg: String
    public let isRadioactive: Int?
    public let decayMode, halfLife, lifetime, neutronMassAbsorption: String
    public let neutronCrossSection, protonAffinity, electronAffinityEV, electronAffinityKJmol: String
    public let electronegativityPauling, electronegativityAllen, electronegativityGhosh, dipolePolarizability: String
    public let dipolePolarizabilityUNC, c6GB, c6Coeff, latticeConstantInternalDefaultRadii: String
    public let latticeConstant, latticeStructure, latticeAngles, oxidationStates: String
    public let electronConfiguration, quantumNumber, electronConfigurationSemantic: String
    public let shells0: Int?
    public let shells1: Int?
    public let shells2: Int?
    public let shells3: Int?
    public let shells4: Int?
    public let shells5: Int?
    public let shells6: Int?
    public let shells7: Int?
    public let ionizationEnergies0, ionizationEnergies1, ionizationEnergies2, ionizationEnergies3: String
    public let ionizationEnergies4, ionizationEnergies5, ionizationEnergies6, ionizationEnergies7: String
    public let ionizationEnergies8, ionizationEnergies9, ionizationEnergies10, ionizationEnergies11: String
    public let ionizationEnergies12, ionizationEnergies13, ionizationEnergies14, ionizationEnergies15: String
    public let ionizationEnergies16, ionizationEnergies17, ionizationEnergies18, ionizationEnergies19: String
    public let ionizationEnergies20, ionizationEnergies21, ionizationEnergies22, ionizationEnergies23: String
    public let ionizationEnergies24, ionizationEnergies25, ionizationEnergies26, ionizationEnergies27: String
    public let ionizationEnergies28, ionizationEnergies29: String
    public let wikipedia: String
    public let eaContentID: Int?

    public enum CodingKeys: String, CodingKey {
        case number
        case nameTr = "name_tr"
        case nameEn = "name_en"
        case alternateName = "alternate_name"
        case symbol
        case casNumber = "cas_number"
        case cidNumber = "cid_number"
        case dotNumber = "dot_number"
        case rtecsNumber = "rtecs_number"
        case mendeleevNumber = "mendeleev_number"
        case pettiforNumber = "pettifor_number"
        case euNumber = "eu_number"
        case spaceGroupNumber = "space_group_number"
        case glaweNumber = "glawe_number"
        case atomicMass = "atomic_mass"
        case atomicMassUncertainty = "atomic_mass_uncertainty"
        case xpos, ypos, period, group, block, category
        case electricalType = "electrical_type"
        case geochemicalClass = "geochemical_class"
        case goldschmidtClass = "goldschmidt_class"
        case gasPhase = "gas_phase"
        case allotropeNames = "allotrope_names"
        case appearance
        case abundanceInEarthCrustC1 = "abundance_in_earth_crust_c1"
        case abundanceInEarthCrustC2 = "abundance_in_earth_crust_c2"
        case abundanceInEarthCrustC3 = "abundance_in_earth_crust_c3"
        case abundanceInEarthCrustC4 = "abundance_in_earth_crust_c4"
        case abundanceInEarthCrustC5 = "abundance_in_earth_crust_c5"
        case abundanceInEarthCrustC6 = "abundance_in_earth_crust_c6"
        case abundanceInEarthCrustU1 = "abundance_in_earth_crust_u1"
        case abundanceInEarthCrustU2 = "abundance_in_earth_crust_u2"
        case abundanceUrbanSoil = "abundance_urban_soil"
        case abundanceMeteorite = "abundance_meteorite"
        case abundanceSeawaterW1 = "abundance_seawater_w1"
        case abundanceSeawaterW2 = "abundance_seawater_w2"
        case abundanceHumans = "abundance_humans"
        case abundanceInHumans2 = "abundance_in_humans_2"
        case abundanceSunS1 = "abundance_sun_s1"
        case abundanceSolarSystemY1 = "abundance_solar_system_y1"
        case abundanceSolarSystemY2 = "abundance_solar_system_y2"
        case atomicRadiusEmpirical = "atomic_radius_empirical"
        case atomicRadiusCalculated = "atomic_radius_calculated"
        case atomicRadiusVanderwaals = "atomic_radius_vanderwaals"
        case vdwRadiusBondi = "vdw_radius_bondi"
        case vdwRadiusTruhlar = "vdw_radius_truhlar"
        case vdwRadiusRt = "vdw_radius_rt"
        case atomicRadiusRahm = "atomic_radius_rahm"
        case vdwRadiusBatsanov = "vdw_radius_batsanov"
        case vdwRadiusDreiding = "vdw_radius_dreiding"
        case vdwRadiusUff = "vdw_radius_uff"
        case vdwRadiusMm3 = "vdw_radius_mm3"
        case vdwRadiusAlvarez = "vdw_radius_alvarez"
        case covalentRadiusBragg = "covalent_radius_bragg"
        case atomicRadiusCovalentSingleBond = "atomic_radius_covalent_single_bond"
        case atomicRadiusCovalentTripleBond = "atomic_radius_covalent_triple_bond"
        case covalentRadiusCordero = "covalent_radius_cordero"
        case covalentRadiusPyykko = "covalent_radius_pyykko"
        case covalentRadiusPyykkoDouble = "covalent_radius_pyykko_double"
        case covalentRadiusPyykkoTriple = "covalent_radius_pyykko_triple"
        case metallicRadiusMendeleev = "metallic_radius_mendeleev"
        case metallicRadiusC12 = "metallic_radius_c12"
        case atomicRadiusMetallic = "atomic_radius_metallic"
        case jmolColor = "jmol_color"
        case molcasGvColor = "molcas_gv_color"
        case cpkColor = "cpk_color"
        case refractiveIndex = "refractive_index"
        case phaseAtStp = "phase_at_stp"
        case meltUse = "melt_use"
        case meltWEL = "melt_WEL"
        case meltCRC = "melt_CRC"
        case meltLNG = "melt_LNG"
        case boilUse = "boil_use"
        case boilWEL = "boil_WEL"
        case boilCRC = "boil_CRC"
        case boilLNG = "boil_LNG"
        case boilZhang = "boil_Zhang"
        case curiePoint = "curie_point"
        case criticalTemperature = "critical_temperature"
        case flashpoint
        case superconductingPoint = "superconducting_point"
        case autoignitionPoint = "autoignition_point"
        case criticalPressure = "critical_pressure"
        case densityRt = "density_rt"
        case densitySolidWEL = "density_solid_WEL"
        case densitySolidLNG = "density_solid_LNG"
        case densitySolidCRC = "density_solid_CRC"
        case densityLiquidCr2 = "density_liquid_cr2"
        case densityGas = "density_gas"
        case molarVolume = "molar_volume"
        case atomicVolume = "atomic_volume"
        case enthalpyOfFusion = "enthalpy_of_fusion"
        case heatOfFusionCRC = "heat_of_fusion_crc"
        case heatOfFusionLng = "heat_of_fusion_lng"
        case heatOfFusionWel = "heat_of_fusion_wel"
        case evaporationHeat = "evaporation_heat"
        case heatOfVaporizationCRC = "heat_of_vaporization_crc"
        case heatOfVaporizationLng = "heat_of_vaporization_lng"
        case heatOfVaporizationWel = "heat_of_vaporization_wel"
        case heatOfVaporizationZhang = "heat_of_vaporization_zhang"
        case heatOfCombustion = "heat_of_combustion"
        case molarHeat = "molar_heat"
        case specificHeatCapacity = "specific_heat_capacity"
        case specificHeatCRC = "specific_heat_crc"
        case specificHeatWel = "specific_heat_wel"
        case specificHeatLng = "specific_heat_lng"
        case thermalConductivity = "thermal_conductivity"
        case thermalExpansion = "thermal_expansion"
        case adiabaticIndex = "adiabatic_index"
        case speedOfSoundLongitudinal = "speed_of_sound_longitudinal"
        case speedOfSoundTransversal = "speed_of_sound_transversal"
        case speedOfSoundExtensional = "speed_of_sound_extensional"
        case speedOfSoundFluid = "speed_of_sound_fluid"
        case electricalResistivity80K = "electrical_resistivity_80K"
        case electricalResistivity273K = "electrical_resistivity_273K"
        case electricalResistivity293K = "electrical_resistivity_293K"
        case electricalResistivity298K = "electrical_resistivity_298K"
        case electricalResistivity300K = "electrical_resistivity_300K"
        case electricalResistivity500K = "electrical_resistivity_500K"
        case magneticOrdering = "magnetic_ordering"
        case neelPoint = "neel_point"
        case magneticSusceptibility = "magnetic_susceptibility"
        case shearModulus = "shear_modulus"
        case bulkModulus = "bulk_modulus"
        case poissonRatio = "poisson_ratio"
        case youngsModulus = "youngs_modulus"
        case mohsHardness = "mohs_hardness"
        case brinellHardness = "brinell_hardness"
        case vickersHardness = "vickers_hardness"
        case welcomeDescription = "description"
        case languageOfOrigin = "language_of_origin"
        case originOfWord = "origin_of_word"
        case originalWord = "original_word"
        case meaning
        case symbolOrigin = "symbol_origin"
        case etymologicalDescription = "etymological_description"
        case observedPredictedBy = "observed_predicted_by"
        case observationOrDiscoveryYear = "observation_or_discovery_year"
        case discoveryLocation = "discovery_location"
        case isolatedSampledBy = "isolated_sampled_by"
        case isolationSampleYear = "isolation_sample_year"
        case namedBy = "named_by"
        case sources, uses
        case spectralImg = "spectral_img"
        case isRadioactive = "is_radioactive"
        case decayMode = "decay_mode"
        case halfLife = "half_life"
        case lifetime
        case neutronMassAbsorption = "neutron_mass_absorption"
        case neutronCrossSection = "neutron_cross_section"
        case protonAffinity = "proton_affinity"
        case electronAffinityEV = "electron_affinity_eV"
        case electronAffinityKJmol = "electron_affinity_kJmol"
        case electronegativityPauling = "electronegativity_pauling"
        case electronegativityAllen = "electronegativity_allen"
        case electronegativityGhosh = "electronegativity_ghosh"
        case dipolePolarizability = "dipole_polarizability"
        case dipolePolarizabilityUNC = "dipole_polarizability_unc"
        case c6GB = "c6_gb"
        case c6Coeff = "c6_coeff"
        case latticeConstantInternalDefaultRadii = "lattice_constant_internal_default_radii"
        case latticeConstant = "lattice_constant"
        case latticeStructure = "lattice_structure"
        case latticeAngles = "lattice_angles"
        case oxidationStates = "oxidation_states"
        case electronConfiguration = "electron_configuration"
        case quantumNumber = "quantum_number"
        case electronConfigurationSemantic = "electron_configuration_semantic"
        case shells0 = "shells-0"
        case shells1 = "shells-1"
        case shells2 = "shells-2"
        case shells3 = "shells-3"
        case shells4 = "shells-4"
        case shells5 = "shells-5"
        case shells6 = "shells-6"
        case shells7 = "shells-7"
        case ionizationEnergies0 = "ionization_energies-0"
        case ionizationEnergies1 = "ionization_energies-1"
        case ionizationEnergies2 = "ionization_energies-2"
        case ionizationEnergies3 = "ionization_energies-3"
        case ionizationEnergies4 = "ionization_energies-4"
        case ionizationEnergies5 = "ionization_energies-5"
        case ionizationEnergies6 = "ionization_energies-6"
        case ionizationEnergies7 = "ionization_energies-7"
        case ionizationEnergies8 = "ionization_energies-8"
        case ionizationEnergies9 = "ionization_energies-9"
        case ionizationEnergies10 = "ionization_energies-10"
        case ionizationEnergies11 = "ionization_energies-11"
        case ionizationEnergies12 = "ionization_energies-12"
        case ionizationEnergies13 = "ionization_energies-13"
        case ionizationEnergies14 = "ionization_energies-14"
        case ionizationEnergies15 = "ionization_energies-15"
        case ionizationEnergies16 = "ionization_energies-16"
        case ionizationEnergies17 = "ionization_energies-17"
        case ionizationEnergies18 = "ionization_energies-18"
        case ionizationEnergies19 = "ionization_energies-19"
        case ionizationEnergies20 = "ionization_energies-20"
        case ionizationEnergies21 = "ionization_energies-21"
        case ionizationEnergies22 = "ionization_energies-22"
        case ionizationEnergies23 = "ionization_energies-23"
        case ionizationEnergies24 = "ionization_energies-24"
        case ionizationEnergies25 = "ionization_energies-25"
        case ionizationEnergies26 = "ionization_energies-26"
        case ionizationEnergies27 = "ionization_energies-27"
        case ionizationEnergies28 = "ionization_energies-28"
        case ionizationEnergies29 = "ionization_energies-29"
        case wikipedia
        case eaContentID = "ea_content_id"
    }
}
