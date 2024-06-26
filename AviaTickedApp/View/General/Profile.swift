//
//  Profile.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.appBlack).ignoresSafeArea()
                Text("Профиль").foregroundStyle(.appWhite)
            }
            .navigationTitle("Профиль")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RootView()
}
