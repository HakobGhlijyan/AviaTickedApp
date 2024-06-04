//
//  LocationView.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        VStack {
            LocationRow(imageName: "stambul", title: "Стамбул")
            LocationRow(imageName: "sochi", title: "Сочи")
            LocationRow(imageName: "pxuket", title: "Пхукет")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(.appGray2)
        )
        
        
    }
}

#Preview {
    LocationView()
        .preferredColorScheme(.dark)
}
