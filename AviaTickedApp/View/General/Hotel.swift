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
            Text("Отели")
                .navigationTitle("Отели")
                .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    Hotel()
}
