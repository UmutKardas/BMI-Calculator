//
//  IHealthService.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 9.10.2024.
//

import Combine

protocol IHealthService {
    func generateUserProfile(userData: UserHealthData) -> AnyPublisher<HealthProfile, NetworkError>
}
