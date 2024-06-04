//
//  AllTicketsViewModel.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI
import Combine


// MARK: - Offer ModelView
final class AllTicketsViewModel: ObservableObject {
    @Published var allTickets: [Ticket] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getTickets()
    }
    
    func getTickets() {
        guard let url = URL(string: "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf") else { return }
                
        URLSession.shared.dataTaskPublisher(for: url)                                   //1
            .subscribe(on: DispatchQueue.global(qos: .background))                      //2 + 2.1 - Optional
            .receive(on: DispatchQueue.main)                                            //3
            .tryMap(handleOutput)                                                       //4
            .decode(type: AllTicketsModel.self, decoder: JSONDecoder())                     //5
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
                self?.allTickets = returnedOffers.tickets
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
