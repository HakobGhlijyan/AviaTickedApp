//
//  Ticket.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

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


#Preview {
//    Ticket()
    RootView()
}
