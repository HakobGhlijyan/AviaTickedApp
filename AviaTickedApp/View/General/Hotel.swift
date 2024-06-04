//
//  Hotel.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct Hotel: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.appBlack).ignoresSafeArea()
                Text("Отели").foregroundStyle(.appWhite)
            }
            .navigationTitle("Отели")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RootView()
}
