//
//  Tickets.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct Tickets: View {
    @AppStorage("textFieldIn") private var textFieldIn: String = ""
    @AppStorage("textFieldOut") private var textFieldOut: String = ""
    @StateObject private var vm = OffersViewModel()
    @State private var textFieldOutPressedForSheet: Bool = false
    
    var body: some View {
        NavigationStack {
                ScrollView(.vertical) {
                    VStack {
                        SearchTitle()
                            .padding(.top, 10)
                            
                        SearchCard(textFieldIn: $textFieldIn, textFieldOut: $textFieldOut, textFieldOutPressedForSheet: $textFieldOutPressedForSheet)
                            .padding(.horizontal, 16)
                            .padding(.top, 18)
                            .sheet(isPresented: $textFieldOutPressedForSheet, content: {
                                SearchView(
                                    textFieldIn: $textFieldIn,
                                    textFieldOut: $textFieldOut,
                                    textFieldOutPressedForSheet: $textFieldOutPressedForSheet
                                )
                            })

                        OffersCardSection
                        
                        OffersCardSection2
                        
                        Spacer()
                    }
//                    .toolbar(.hidden, for: .navigationBar)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "gear")
                            })
                            .tint(.primary)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "plus")
                            })
                            .tint(.primary)
                        }
                    }
                    .navigationTitle("Авиабилеты")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
    }
}

extension Tickets {
    private var OffersCardSection: some View {
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
                    .background(.appGray5)
                    .cornerRadius(10)
            })
            .padding(16)
            
        }
        .padding(.top, 16)
    }
    private var OffersCardSection2: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Ваш первый раз")
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
                    .background(.appGray5)
                    .cornerRadius(10)
            })
            .padding(16)
            
        }
        .padding(.top, 16)
    }
}

#Preview {
    RootView()
}
