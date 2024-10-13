//
//  StyledNavigationLink.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 9.10.2024.
//

import SwiftUI

struct StyledNavigationLink<T: View>: View {
    var view: T
    var title: String
    var imageName: String

    var body: some View {
        NavigationLink {
            view
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text(title)
                    .font(.headline)
                Image(systemName: imageName)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.2)
            .background(Color("greenColor"))
            .cornerRadius(10)
            .foregroundStyle(.white)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    StyledNavigationLink(view: HomeUIView(), title: "CALCULATE", imageName: "arrow.trianglehead.2.counterclockwise")
}
