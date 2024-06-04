//
//  ContentView.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 03.06.2024.
//

import SwiftUI
import Combine

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

struct Ticket: View {
    @AppStorage("textFieldIn") private var textFieldIn: String = ""
    @AppStorage("textFieldOut") private var textFieldOut: String = ""
    @StateObject private var vm = OffersViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    SearchTitle()
                        .padding(.top, 20)
                        
                    SearchCard(textFieldIn: $textFieldIn, textFieldOut: $textFieldOut)
                        .padding(.horizontal, 16)
                        .padding(.top, 28)

                    VStack(alignment: .leading, spacing: 16.0) {
                        Text("Музыкально отлететь")
                            .fontWeight(.semibold)
                            .font(.system(size: 22))
                            .padding(.leading, 16)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(vm.allOffers) { offer in
                                    OffersCard(
                                        title: offer.title,
                                        town: offer.town,
                                        price: offer.price.value,
                                        imageName: String(offer.id)
                                    )
                                }
                            }
                            .offset(x: 16)
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
                        .padding(16)
                        
                    }
                    .padding(.top, 16)
                    
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
            Button(action: {
                
            }, label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 16, height: 16)
            })
            
            VStack {
                TextField(text: $textFieldIn) {
                    Text("Откуда - Москва")
                }
                
                RoundedRectangle(cornerRadius: 1)
                    .foregroundStyle(.gray)
                    .frame(height: 1)
                
                TextField(text: $textFieldOut) {
                    Text("Куда - Турция")
                }
            }
            .foregroundStyle(.appWhite)
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

// MARK: - Offer View
struct OffersCard: View {
    var title: String
    var town: String
    var price: Int
    var imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .frame(width: 140,height: 140)
                .cornerRadius(16)
            
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(town)
                    .font(.subheadline)
                
                HStack {
                    Image(systemName: "airplane")
                    Text("от \(price) ₽ ")
                }
            }
        }
        .background(.black.opacity(0.001))
    }
}
