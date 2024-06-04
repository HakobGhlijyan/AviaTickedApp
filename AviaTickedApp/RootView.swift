//
//  ContentView.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 03.06.2024.
//

import SwiftUI
import Combine

struct RootView: View {
    // Active Tab
    @State private var acriveTab: Tab = .ticket
    
    var body: some View {
        TabView(selection: $acriveTab) {
            Ticket()
                .tag(Tab.ticket)
                .tabItem { Tab.ticket.tabContent }
            Hotel()
                .tag(Tab.hotel)
                .tabItem { Tab.hotel.tabContent }
            Map()
                .tag(Tab.map)
                .tabItem { Tab.map.tabContent }
            Subscribe()
                .tag(Tab.subscribe)
                .tabItem { Tab.subscribe.tabContent }
            Profile()
                .tag(Tab.profile)
                .tabItem { Tab.profile.tabContent }
        }
    }
}

#Preview {
    RootView()
}
