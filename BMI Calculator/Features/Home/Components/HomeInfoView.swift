//
//  HomeInfoView.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 8.10.2024.
//

import SwiftUI

struct HomeInfoView: View {
    var title: String
    var description: String
    @Binding var value: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color("backgroundColor"))

            VStack(spacing: 20) {
                Text(title)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                HStack(spacing: 15) {
                    Button {}
                        label: {
                            Text("-")
                                .font(Font.system(size: 35, weight: .regular, design: .rounded))
                                .foregroundStyle(.black)
                                .background(
                                    Rectangle()
                                        .fill(Color("greenColor"))
                                        .frame(width: 30, height: 30)
                                        .cornerRadius(5)
                                )
                        }
                    Text("\(value)")
                        .font(Font.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    Button {}
                        label: {
                            Text("+")
                                .font(Font.system(size: 35, weight: .regular, design: .rounded))
                                .foregroundStyle(.black)
                                .background(
                                    Rectangle()
                                        .fill(Color("greenColor"))
                                        .frame(width: 30, height: 30)
                                        .cornerRadius(5)
                                )
                        }
                }

                Text(description)
                    .font(.footnote)
                    .foregroundStyle(.white)
                    .opacity(0.5)
            }
        }.frame(width: UIScreen.main.bounds.width * 0.43, height: UIScreen.main.bounds.width * 0.43)
    }
}

#Preview {
    HomeInfoView(title: "AGE", description: "years old", value: .constant(23))
}
