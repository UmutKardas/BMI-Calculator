//
//  NetworkError.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 9.10.2024.
//

enum NetworkError: Error {
    case invalidData
    case invalidPath
    case unknownError(String)
}
