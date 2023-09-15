//
//  CardScrollView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/14.
//

import SwiftUI

struct CardScrollView: View {
    var cards = MockData.cards()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 8) {
                ForEach(cards) { card in
                    let index = CGFloat(indexOf(card))
                    CardView(card: card)
                        .frame(height: 160)
                        .offset(y: index * -200)
                }
            }
            .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity)
        .background {
            CustomCorner(corners: [.topLeft, .topRight], radius: 30)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: .black.opacity(0.05),
                        radius: 10,
                        x: 0,
                        y: -5)
        }
    }
    
    func indexOf(_ card: CardModel) -> Int {
        return cards.firstIndex {
            card.id == $0.id
        } ?? 0
    }
}

struct CardScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CardScrollView()
    }
}
