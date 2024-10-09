//
//  UserHealthData.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 9.10.2024.
//

import Foundation

struct UserHealthData: Codable {
    let weight, height: Eight
    let sex, age: String
}

struct Eight: Codable {
    let value, unit: String
}
