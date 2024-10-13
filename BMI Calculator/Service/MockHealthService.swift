//
//  MockHealthService.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 9.10.2024.
//

import Combine
import Foundation

final class MockHealthService: IHealthService {
    func generateUserProfile(userData: UserHealthData) -> AnyPublisher<HealthProfile, NetworkError> {
        guard let mockHealthDataPath = Bundle.main.path(forResource: "mockHealthData", ofType: ".json") else {
            return Fail(error: NetworkError.invalidPath)
                .eraseToAnyPublisher()
        }

        do {
            guard let data = try? Data(contentsOf: URL(filePath: mockHealthDataPath)) else {
                return Fail(error: NetworkError.unknownError("Unable to load data from file."))
                    .eraseToAnyPublisher()
            }
            let healthProfile = try JSONDecoder().decode(HealthProfile.self, from: data)
            return Just(healthProfile)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: NetworkError.unknownError(error.localizedDescription))
                .eraseToAnyPublisher()
        }
    }
}
