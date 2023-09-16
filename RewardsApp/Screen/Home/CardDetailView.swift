//
//  CardDetailView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/15.
//

import SwiftUI

struct CardDetailView: View {
    var card: CardModel
    var body: some View {
        NavigationView {
           CardView(card: card)
        }
        .navigationTitle(Text("Store Detail"))
        .padding(.horizontal, 16)
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: MockData.singleCard())
    }
}
