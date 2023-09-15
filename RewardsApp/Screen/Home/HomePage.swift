//
//  ContentView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/14.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("show menu")
                } label: {
                    Image("menu")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                SearchView()
                Button {
                    print("show scan")
                } label: {
                    Image("scan")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
            }
            CategoryScrollView()
                .frame(height:56)
            CardsView()
        }
        .padding(.horizontal, 16)
        .background {
            Rectangle()
                .fill(.black.opacity(0.02))
                .ignoresSafeArea()
        }
        .overlayPreferenceValue(CardRectKey.self) { preferences in
            if let cardPreference = preferences["CardRect"] {
                GeometryReader { proxy in
                    let cardRect = proxy[cardPreference]
                    
                    CardScrollView()
                        .frame(width: cardRect.width, height: cardRect.height)
                        .offset(x: cardRect.minX, y: cardRect.minY)
                }
            }
        }
    }
    @ViewBuilder
    func CardsView() -> some View {
        Rectangle()
            .foregroundColor(.clear)
            .anchorPreference(key: CardRectKey.self, value: .bounds) { anchor in
                return ["CardRect": anchor]
            }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
