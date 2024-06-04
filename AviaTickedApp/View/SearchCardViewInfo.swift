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
    
    var body: some View {
        VStack {
            SearchCardInfo(textFieldIn: $textFieldIn, textFieldOut: $textFieldOut, textFieldOutPressedForSheet: $textFieldOutPressedForSheet)
                .padding(.vertical, 24)
                .padding(.horizontal, 16)
            
            
            
            
            Spacer()
        }
    }
}

#Preview {
    RootView()
}
