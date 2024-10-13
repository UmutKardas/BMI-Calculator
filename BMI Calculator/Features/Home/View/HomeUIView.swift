//
//  HomeUIView.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 7.10.2024.
//

import SwiftUI

struct HomeUIView: View {
    @StateObject var viewModel: HomeViewModel = .init(service: HealthService())
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                    HStack {
                        HomeButtonInfoView(title: "MALE", imageName: "maleIcon", type: .male, selectedGender: $viewModel.gender)

                        Spacer()
                        
                        HomeButtonInfoView(title: "FEMALE", imageName: "femaleIcon", type: .female, selectedGender: $viewModel.gender)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                    .padding(.top, 10)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color("backgroundColor"))
                        VStack {
                            Text("Height")
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .top], 10)
                            
                            Spacer()
                            Text(String(format: "%.0f", viewModel.height))
                                .font(Font.system(size: 50, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                            
                            Spacer()
                            Slider(value: $viewModel.height, in: 0 ... 250)
                                .padding(.horizontal, 10)
                                .tint(.gray)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.45)
                    
                    HStack {
                        HomeInfoView(title: "WEIGHT", description: "kg", value: $viewModel.weight)
                        
                        Spacer()
                        
                        HomeInfoView(title: "AGE", description: "years old", value: $viewModel.age)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    
                    Button {
                        viewModel.fetchBMI()
                    } label: {
                        HStack {
                            Text("CALCULATE")
                                .font(.headline)
                            Image(systemName: "arrow.trianglehead.2.counterclockwise")
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.2)
                        .background(Color("greenColor"))
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                        .padding(.bottom, 20)
                    }
                }
                .navigationDestination(isPresented: $viewModel.shouldNavigate, destination: {
                    ResultUIView(viewModel: ResultViewModel(result: viewModel.result))
                        .navigationBarBackButtonHidden(true)
                })
                .toolbar {
                    MainToolbarView()
                }
            }
        }
    }
}

#Preview {
    HomeUIView()
}
