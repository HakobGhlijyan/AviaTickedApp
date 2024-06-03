//
//  ContentView.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 03.06.2024.
//

import SwiftUI

struct ContentView: View {
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
        .background()
    }
}

#Preview {
    ContentView()
}

enum Tab: String {
    case ticket = "Авиабилеты"
    case hotel = "Отели"
    case map = "Короче"
    case subscribe = "Подписки"
    case profile = "Профиль"
    
    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .ticket:
            Image(systemName: "airplane")
            Text(self.rawValue)
        case .hotel:
            Image(systemName: "sofa.fill")
            Text(self.rawValue)
        case .map:
            Image(systemName: "map.fill")
            Text(self.rawValue)
        case .subscribe:
            Image(systemName: "bell.fill")
            Text(self.rawValue)
        case .profile:
            Image(systemName: "person.fill")
            Text(self.rawValue)
        }
        
    }
}

struct Ticket: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Авиабилеты")
                Text("Авиабилеты")
                Text("Авиабилеты")
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct Hotel: View {
    var body: some View {
        NavigationStack {
            Text("Отели")
                .navigationTitle("Отели")
        }
    }
}

struct Map: View {
    var body: some View {
        NavigationStack {
            Text("Короче")
                .navigationTitle("Короче")
        }
    }
}

struct Subscribe: View {
    var body: some View {
        NavigationStack {
            Text("Подписки")
                .navigationTitle("Подписки")
        }
    }
}

struct Profile: View {
    var body: some View {
        NavigationStack {
            Text("Профиль")
                .navigationTitle("Профиль")
        }
    }
}
