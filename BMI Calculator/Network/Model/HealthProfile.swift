//
//  HealthProfile.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 9.10.2024.
//

import Foundation

struct HealthProfile: Codable {
    let weight: Weight
    let height: Height
    let bmi: Bmi
    let idealWeight, surfaceArea, ponderalIndex: String
    let bmr: Bmr
    let whr, whtr: Whr
    let sex, age, waist, hip: String

    enum CodingKeys: String, CodingKey {
        case weight, height, bmi
        case idealWeight = "ideal_weight"
        case surfaceArea = "surface_area"
        case ponderalIndex = "ponderal_index"
        case bmr, whr, whtr, sex, age, waist, hip
    }
}

struct Bmi: Codable {
    let value, status, risk, prime: String
}

struct Bmr: Codable {
    let value: String
}

struct Height: Codable {
    let m, cm, heightIn, ftIn: String

    enum CodingKeys: String, CodingKey {
        case m, cm
        case heightIn = "in"
        case ftIn = "ft-in"
    }
}

struct Weight: Codable {
    let kg, lb: String
}

struct Whr: Codable {
    let value, status: String
}
