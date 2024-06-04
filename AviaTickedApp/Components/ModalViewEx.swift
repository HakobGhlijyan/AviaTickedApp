//
//  ModalViewEx.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct ModalViewEx: View {
    
    var imageColor: Color
    var recColor: Color
    var imageName: String
    var title: String
    var action: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(recColor)
                    .frame(width: 48, height: 48)
                    
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(imageColor)
            }
            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
            
        }
        .onTapGesture {
            action?()
        }
    }
}

#Preview {
    VStack {
        ModalViewEx(imageColor: .appWhite, recColor: .appGreen, imageName: "map.circle", title: "Сложный \nмаршрут")
        ModalViewEx(imageColor: .appWhite, recColor: .appBlue, imageName: "globe", title: "Куда угодно")
        ModalViewEx(imageColor: .appWhite, recColor: .appDarkBlue, imageName: "calendar", title: "Выходные")
        ModalViewEx(imageColor: .appWhite, recColor: .appRed, imageName: "flame", title: "Горячие \nбилеты")
    }
    .preferredColorScheme(.dark)

}
