//
//  HealthService.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 9.10.2024.
//

import Alamofire
import Combine
import Foundation

final class HealthService: IHealthService {
    func generateUserProfile(userData: UserHealthData) -> AnyPublisher<HealthProfile, NetworkError> {
        return AF.request(ApiPath.bmiPostAPI.rawValue, method: .post, parameters: userData, encoder: JSONParameterEncoder.default, headers: ApiHeader.defaultHeaders)
            .validate()
            .publishDecodable(type: HealthProfile.self, decoder: JSONDecoder())
            .flatMap { response -> AnyPublisher<HealthProfile, NetworkError> in
                if let error = response.error {
                    print("Request error: \(error)")
                    return Fail(error: .unknownError(error.localizedDescription)).eraseToAnyPublisher()
                }

                guard let healthProfile = response.value else {
                    print("Invalid data received")
                    return Fail(error: .invalidData).eraseToAnyPublisher()
                }

                return Just(healthProfile)
                    .setFailureType(to: NetworkError.self)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
