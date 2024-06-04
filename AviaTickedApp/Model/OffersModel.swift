//
//  OffersModel.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

// MARK: - Offer Model
struct OffersModel: Codable {
    let offers: [Offer]
}

// MARK: - Offer
struct Offer: Identifiable, Codable {
    let id: Int
    let title, town: String
    let price: Price
}

// MARK: - Price
struct Price: Codable {
    let value: Int
}
