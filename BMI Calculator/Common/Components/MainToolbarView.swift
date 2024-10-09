//
//  MainToolbarView.swift
//  BMI Calculator
//
//  Created by Hüseyin Umut Kardaş on 9.10.2024.
//

import SwiftUI

struct MainToolbarView: ToolbarContent {
    var body: some ToolbarContent {
        Group {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "gearshape")
                    .foregroundStyle(Color.white)
            }

            ToolbarItem(placement: .navigationBarLeading) {
                Text("BMI Calculator")
                    .font(.headline)
                    .foregroundStyle(Color.white)
            }
        }
    }
}
