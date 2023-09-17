//
//  CardScrollView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/14.
//

import SwiftUI

struct CardScrollView: View {
    var cards = MockData.cards()
    @State private var expandCards: Bool = false
    @State private var showDetailView: Bool = false
    
    @Binding var selectedCard: CardModel?
    @Namespace private var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 8) {
                ForEach(cards) { card in
                    let index = CGFloat(indexOf(card))
                    if showDetailView {
                        NavigationLink(destination: CardDetailPage(card: card)) {
                            CardView(card: card)
                                .frame(height: 160)
                                .offset(y: 0)
                        }
                    } else {
                        CardView(card: card)
                            .frame(height: 160)
                            .offset(y: expandCards ? 0 : index * -90)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.35)) {
                                    expandCards = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.36) {
                                    showDetailView = true
                                }
                            }
                    }
                }
            }
            .padding(.bottom, CGFloat(cards.count-1) * -200)
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
        .onAppear {
            showDetailView = false
            expandCards = false
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
        CardScrollView(selectedCard: .constant(MockData.singleCard()))
    }
}
