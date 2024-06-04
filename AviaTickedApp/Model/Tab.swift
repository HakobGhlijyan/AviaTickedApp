//
//  Tab.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

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
