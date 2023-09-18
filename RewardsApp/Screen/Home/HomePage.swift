//
//  ContentView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/14.
//

import SwiftUI
import Combine

struct HomePage: View {
    @State var selectedCard: CardModel?
    @State var shouldNav: Bool = false
    @State var showScan: Bool = false
    @State var shouldStartScan: Bool = false
    @StateObject var viewModel = BarcodeScannerViewModel()
    var cancellables = Set<AnyCancellable>()
    @State var shouldPresent: Bool = false
    @State var cards = MockData.cards()
    
    var body: some View {
        NavigationView {
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
                    NavigationLink(destination: ScannerPage(viewModel: viewModel)) {
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
                if !showScan {
                    if let cardPreference = preferences["CardRect"] {
                        GeometryReader { proxy in
                            let cardRect = proxy[cardPreference]
                            CardScrollView( cards: $cards, selectedCard: $selectedCard)
                                .frame(width: cardRect.width, height: cardRect.height)
                                .offset(x: cardRect.minX, y: cardRect.minY)
                        }
                    }
                }
            }
        }
        .onChange(of: viewModel.scannedCode, perform: { scanedCode in
            if scanedCode != "" {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    shouldPresent = true
                }
                cards[cards.count-1].checkMarks += 1
                viewModel.scannedCode = ""
            }
        })
        .alert("reward added", isPresented: $shouldPresent) {
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
