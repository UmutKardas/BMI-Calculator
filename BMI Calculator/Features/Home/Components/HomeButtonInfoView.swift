//
//  HomeButtonInfoView.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 8.10.2024.
//

import SwiftUI

struct HomeButtonInfoView: View {
    var title: String
    var imageName: String
    var type: Gender
    var selectedGender: Binding<Gender>

    var body: some View {
        Button {
            selectedGender.wrappedValue = type
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(type == selectedGender.wrappedValue ? "selectedColor" : "backgroundColor"))
                VStack(spacing: 20) {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)

                    Text(title)
                        .font(.headline)
                        .foregroundStyle(Color.white)
                }
            }.frame(width: UIScreen.main.bounds.width * 0.44, height: UIScreen.main.bounds.height * 0.25)
        }
    }
}

#Preview {
    HomeButtonInfoView(title: "FEMALE", imageName: "femaleIcon", type: .female, selectedGender: .constant(.female))
}
