//
//  Elements.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct Elements: View {
    var backAction:(() -> Void)?
    var dateAction:(() -> Void)?
    var personAction:(() -> Void)?
    var filterAction:(() -> Void)?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                back
                date
                person
                filter
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity)
        .frame(height: 34)
    }
    
    private var back: some View {
        Button(action: {
            backAction?()
        }, label: {
            HStack(spacing: 8.0) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 16, height: 16)
                
                Text("обратно")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(.appGray3)
            .cornerRadius(20)
        })
        .tint(.appWhite)
    }
    
    
    private var date: some View {
        Button(action: {
            dateAction?()
        }, label: {
            HStack(spacing: 8.0) {
                Text("24 фев")
                    .font(.system(size: 14))
                Text("сб")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(.appGray3)
            .cornerRadius(20)
        })
        .tint(.appWhite)
    }
    
    private var person: some View {
        Button(action: {
            personAction?()
        }, label: {
            HStack(spacing: 8.0) {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 16, height: 16)
                
                Text("1, эконом")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(.appGray3)
            .cornerRadius(20)
        })
        .tint(.appWhite)
    }
    
    private var filter: some View {
        Button(action: {
            filterAction?()
        }, label: {
            HStack(spacing: 8.0) {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .resizable()
                    .frame(width: 16, height: 16)
                
                Text("Фильтр")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(.appGray3)
            .cornerRadius(20)
        })
        .tint(.appWhite)
    }
    
}

#Preview {
    Elements()
        .preferredColorScheme(.dark)

}
