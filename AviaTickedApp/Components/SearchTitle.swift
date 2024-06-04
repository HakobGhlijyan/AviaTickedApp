//
//  SearchTitle.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct SearchTitle: View {
    var body: some View {
        Text("Поиск дешевых \nвиабилетов")
            .multilineTextAlignment(.center)
            .font(.system(size: 22, weight: .bold))
    }
}


#Preview {
    SearchTitle()
        .preferredColorScheme(.dark)

}
