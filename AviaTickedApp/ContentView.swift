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
    @State private var textFieldIn: String = ""
    @State private var textFieldOut: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    SearchTitle()
                        .padding(.top, 28)
                        
                    SearchCard(textFieldIn: $textFieldIn, textFieldOut: $textFieldOut)
                        .padding(.horizontal, 16)
                        .padding(.top, 38)

                    VStack(alignment: .leading, spacing: 26.0) {
                        Text("Музыкально отлететь")
                            .fontWeight(.semibold)
                            .font(.system(size: 22))
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(0 ..< 5) { item in
                                    Offers(
                                        offers: OffersModel(
                                            id: 1,
                                            title: "Die Antwoord",
                                            town: "Будапешт",
                                            price: 22264
                                        )
                                    )
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Показать все места")
                                .font(.headline)
                                .foregroundStyle(.appWhite)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(.appGray4)
                                .cornerRadius(10)
                        })
                    }
                    .padding(16)
                    
                    
                    
                    Spacer()
                }
                .toolbar(.hidden, for: .navigationBar)
            }
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

struct SearchCard: View {
    @Binding var textFieldIn: String
    @Binding var textFieldOut: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 16, height: 16)
            
            VStack {
                TextField(text: $textFieldIn) {
                    Text("Минск")
                        .foregroundStyle(.appWhite)
                }
                
                RoundedRectangle(cornerRadius: 1)
                    .foregroundStyle(.gray)
                    .frame(height: 1)
                
                TextField(text: $textFieldOut) {
                    Text("Куда - Турция")
                }
            }
            .padding(.vertical, 8)
        }
        .bold()
        .foregroundStyle(.gray)
        .padding()
        .background(.appGray4)
        .cornerRadius(16)
        .padding()
        .background(.appGray3)
        .cornerRadius(16)
    }
}

struct SearchTitle: View {
    var body: some View {
        Text("Поиск дешевых \nвиабилетов")
            .multilineTextAlignment(.center)
            .font(.system(size: 22, weight: .bold))
    }
}


struct OffersModel {
    var id: Int
    var title: String
    var town: String
    var price: Int
}

struct Offers: View {
    var offers: OffersModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Rectangle()
                .frame(width: 133,height: 133)
                .cornerRadius(16)
            
            Text(offers.title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(offers.town)
                    .font(.subheadline)
                
                HStack {
                    Image(systemName: "airplane")
                    Text("от \(offers.price) ₽ ")
                }
            }
        }
    }
}
