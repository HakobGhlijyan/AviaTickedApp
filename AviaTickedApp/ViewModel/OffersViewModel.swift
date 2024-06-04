//
//  OffersViewModel.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI
import Combine

// MARK: - Offer ModelView
final class OffersViewModel: ObservableObject {
    @Published var allOffers: [Offer] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getOffers()
    }
    
    func getOffers() {
        guard let url = URL(string: "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd") else { return }
                
        URLSession.shared.dataTaskPublisher(for: url)                                   //1
            .subscribe(on: DispatchQueue.global(qos: .background))                      //2 + 2.1 - Optional
            .receive(on: DispatchQueue.main)                                            //3
            .tryMap(handleOutput)                                                       //4
            .decode(type: OffersModel.self, decoder: JSONDecoder())                     //5
            .sink { (completion) in                                                     //6
                //1
                print("COMPLETION: \(completion)")
                //2 ERRORS - In SWITCH
                switch completion {
                case .finished:
                    print("COMPLETION: \(completion)")
                case .failure(let error):
                    print("COMPLETION ERROR: \(error)")
                }
            } receiveValue: { [weak self] (returnedOffers) in
                self?.allOffers = returnedOffers.offers
            }
        
            .store(in: &cancellables)                                                   //7
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}

