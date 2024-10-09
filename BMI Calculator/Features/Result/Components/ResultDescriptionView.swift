//
//  ResultDescriptionView.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 8.10.2024.
//

import SwiftUI

struct ResultDescriptionView: View {
    var title: String
    var description: String

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.white)
            .opacity(0.7)
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            .padding(.top, 10)

        Text("- \(description)")
            .font(.footnote)
            .foregroundStyle(.white)
            .opacity(0.7)
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            .padding(.top, 5)
    }
}

#Preview {
    ResultDescriptionView(title: "Low Risk", description: "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes")
}
