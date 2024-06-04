//
//  SearchCardViewInfo.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct SearchCardViewInfo: View {
    @Binding var textFieldIn: String
    @Binding var textFieldOut: String
    @Binding var textFieldOutPressedForSheet: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var vm = TicketsOffersViewModel()
    
    @State private var date: Date = .now
    @State private var dateAction: Bool = false
    
    @State private var toogleAction: Bool = false
    
    @State private var allTickedInfoList: Bool = false

    
    var body: some View {
        ScrollView {
            VStack {
                SearchCardInfo(textFieldIn: $textFieldIn, textFieldOut: $textFieldOut, textFieldOutPressedForSheet: $textFieldOutPressedForSheet)
                    .padding(.top, 24)
                    .padding(.horizontal, 16)
                
                Elements(
                    backAction: nil,
                    dateAction: nil,
                    personAction: nil,
                    filterAction: nil
                )
                .padding(.top, 8)
                .padding(.horizontal, 16)
                            
                ticketsListRow
                    .padding(.horizontal, 16)

                allTickedButton

                subscribe
                
                Spacer()
            }
            .fullScreenCover(isPresented: $allTickedInfoList,
                             content: {
                SearchAllTickedInfo(
                    textFieldIn: $textFieldIn,
                    textFieldOut: $textFieldOut,
                    textFieldOutPressedForSheet: $textFieldOutPressedForSheet
                )
            })
            .scrollIndicators(.hidden)
        }
    }
    
    private var ticketsListRow: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Прямые рельсы")
                .font(.title2)
                .fontWeight(.semibold)
            
            VStack {
                ForEach(vm.allTicketsOffers) { ticketsOffers in
                    TicketsListRow(title: ticketsOffers.title, timeRange: ticketsOffers.timeRange, price: ticketsOffers.price)
                }
            }
            
            Button(action: {
                
            }, label: {
                Text("Показать все")
                    .font(.headline)
                    .foregroundStyle(.appBlue)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.black.opacity(0.001))
                    .cornerRadius(10)
            })
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(.appGray2)
        .cornerRadius(16)
        .scrollIndicators(.hidden)
    }
    
    private var subscribe: some View {
        HStack(spacing: 8.0) {
            Image(systemName: "bell.fill")
                .foregroundStyle(.appBlue)
                                
            Toggle("Подписка на цену", isOn: $toogleAction)
        }
        .frame(height: 55)
        .font(.headline)
        .foregroundStyle(.appWhite)
        .padding(.horizontal, 16)
        .background(.appGray4)
        .cornerRadius(10)
        .padding(.horizontal, 16)
    }
    
    private var allTickedButton: some View {
        Button(action: {
            allTickedInfoList.toggle()
        }, label: {
            Text("Показать все билеты")
                .font(.headline)
                .foregroundStyle(.appWhite)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.appBlue)
                .cornerRadius(10)
        })
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
    }
    
}

#Preview {
    RootView()
}
