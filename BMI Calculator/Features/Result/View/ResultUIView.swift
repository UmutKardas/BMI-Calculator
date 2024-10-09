//
//  ResultUIView.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 7.10.2024.
//

import SwiftUI

struct ResultUIView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()

                VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                    Text("Result")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .frame(width: 360, alignment: .leading)
                        .padding(.top, 20)

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color("backgroundColor"))
                        VStack {
                            HStack {
                                Text("Your BMI is")
                                    .font(.footnote)
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading, .top], 10)

                                Spacer()

                                Text("Underweight")
                                    .font(.footnote)
                                    .foregroundStyle(Color("greenColor"))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding([.trailing, .top], 10)
                            }

                            Spacer()
                            Text("18.5")
                                .font(Font.system(size: 60, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)

                            Spacer()
                            Slider(value: .constant(180), in: 0 ... 250)
                                .padding(.horizontal, 10)
                                .tint(.gray)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.45)

                    Text("Underweight")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .frame(width: 360, alignment: .leading)
                        .padding(.top, 20)

                    ResultDescriptionView(title: "Low Risk", description: "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes")

                    Spacer()

                    StyledNavigationLink(view: HomeUIView(), title: "RE-CALCULATE", imageName: "arrow.trianglehead.2.counterclockwise")
                }
            }
            .toolbar {
                MainToolbarView()
            }
        }
    }
}

#Preview {
    ResultUIView()
}
