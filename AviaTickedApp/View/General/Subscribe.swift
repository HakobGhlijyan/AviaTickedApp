//
//  Subscribe.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct Subscribe: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.appBlack).ignoresSafeArea()
                Text("Подписки").foregroundStyle(.appWhite)
            }
            .navigationTitle("Подписки")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RootView()
}
