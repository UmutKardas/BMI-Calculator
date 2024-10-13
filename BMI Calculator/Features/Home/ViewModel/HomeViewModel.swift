//
//  HomeViewModel.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 13.10.2024.
//

import Combine

final class HomeViewModel: ObservableObject {
    @Published var height: Double = 150
    @Published var weight: Int = 70
    @Published var age: Int = 20
    @Published var gender: Gender = .male
    @Published var errorMessage: String?
    @Published var shouldNavigate: Bool = false
    @Published var result: HealthProfile? {
        didSet {
            shouldNavigate = true
        }
    }

    var subscriptions: Set<AnyCancellable> = .init()
    var service: IHealthService

    init(service: IHealthService) {
        self.service = service
    }

    func fetchBMI() {
        let data = UserHealthData(
            weight: Measurement(value: "\(weight)", unit: "kg"),
            height: Measurement(value: String(format: "%.2f", height), unit: "cm"),
            sex: gender.rawValue,
            age: "\(age)"
        )

        service.generateUserProfile(userData: data)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] result in
                self?.result = result
            }
            .store(in: &subscriptions)
    }
}
