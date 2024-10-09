//
//  HomeUIView.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 7.10.2024.
//

import SwiftUI

struct HomeUIView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                    HStack {
                        HomeButtonInfoView(title: "MALE", imageName: "maleIcon")

                        Spacer()
                        
                        HomeButtonInfoView(title: "FEMALE", imageName: "femaleIcon")
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                    .padding(.top,10)
                    
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
                            Text("180")
                                .font(Font.system(size: 50, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                            
                            Spacer()
                            Slider(value: .constant(180), in: 0 ... 250)
                                .padding(.horizontal, 10)
                                .tint(.gray)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.45)
                    
                    HStack {
                        HomeInfoView(title: "WEIGHT", description: "kg", value: .constant(65))
                        
                        Spacer()
                        
                        HomeInfoView(title: "AGE", description: "years old", value: .constant(23))
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    
                    StyledNavigationLink(view: ResultUIView(), title: "CALCULATE", imageName: "arrow.trianglehead.2.counterclockwise")
                }
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
