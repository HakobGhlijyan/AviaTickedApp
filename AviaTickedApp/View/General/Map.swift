//
//  Map.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct Map: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.appBlack).ignoresSafeArea()
                Text("Короче").foregroundStyle(.appWhite)
            }
            .navigationTitle("Короче")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    RootView()
}
