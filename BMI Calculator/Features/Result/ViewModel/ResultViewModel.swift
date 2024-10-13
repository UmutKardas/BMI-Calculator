//
//  ResultViewModel.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 13.10.2024.
//

import SwiftUI

final class ResultViewModel: ObservableObject {
    @Published var result: HealthProfile?

    init(result: HealthProfile? = nil) {
        self.result = result
    }
}
