//
//  Location.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import Foundation

class Location {
    var location: [String] = [
        "Лондон", "Берлин", "Мадрид", "Парос", "Мумбаи", "Ереван", "Стамбул", "Сочи", "Пхукет",
    ]

    func randomLocation() -> String? {
        return location.randomElement()
    }
}
