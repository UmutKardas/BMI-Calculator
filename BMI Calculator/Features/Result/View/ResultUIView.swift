//
//  ResultUIView.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 7.10.2024.
//

import SwiftUI

struct ResultUIView: View {
    @StateObject var viewModel: ResultViewModel

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
                            }

                            Spacer()
                            Text(viewModel.result?.bmi?.value ?? "")
                                .font(Font.system(size: 60, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)

                            Spacer()

                            if let value = Double(viewModel.result?.bmi?.value ?? "") {
                                Slider(value: .constant(value), in: 0 ... 250)
                                    .padding(.horizontal, 10)
                                    .tint(.gray)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.45)

                    Text("\(viewModel.result?.bmi?.status ?? "")")
                        .font(.title2)
                        .foregroundStyle(Color("greenColor"))
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                        .padding(.top, 20)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)

                    Text("- \(viewModel.result?.bmi?.risk ?? "")")
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .opacity(0.7)
                        .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                        .padding(.top, 5)

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
    ResultUIView(viewModel: ResultViewModel(result: nil))
}
