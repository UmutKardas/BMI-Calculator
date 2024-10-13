//
//  UserHealthData.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 9.10.2024.
//

import Foundation

struct UserHealthData: Codable {
    let weight, height: Measurement
    let sex, age: String
}

struct Measurement: Codable {
    let value, unit: String
}
