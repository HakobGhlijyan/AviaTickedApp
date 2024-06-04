//
//  LocationRow.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct LocationRow: View {
    var imageName: String
    var title: String
    var subTitle: String = "Популярное направление"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16.0) {
                Image(imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                VStack(alignment: .leading, spacing: 6.0) {
                    Text(title)
                        .font(.headline)
                    Text(subTitle)
                        .font(.subheadline)
                        .fontWeight(.light)
                }
            }
            RoundedRectangle(cornerRadius: 2)
                .foregroundStyle(.appGray4)
                .frame(height: 2)
        }
    }
}

#Preview {
    VStack {
        LocationRow(imageName: "stambul", title: "Стамбул")
        LocationRow(imageName: "sochi", title: "Сочи")
        LocationRow(imageName: "pxuket", title: "Пхукет")
    }
    .preferredColorScheme(.dark)

}
