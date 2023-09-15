//
//  CategoryScrollView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/14.
//

import SwiftUI

enum Categories: CaseIterable {
    case all, latest, myMark, myRedeem
    
    var value: String {
        switch self {
        case .all:
            return "All"
        case .latest:
            return "Latest"
        case .myMark:
            return "My Mark"
        case .myRedeem:
            return "My Redeem"
        }
    }
    
    static func allCategoiesStringList() -> [String] {
        return Categories.allCases.map { $0.value }
    }
}

struct CategoryScrollView: View {
    
    var itemList = Categories.allCategoiesStringList()
    @State var currentSelected = 0
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0 ..< itemList.count, id: \.self) { i in
                    Button {
                        self.currentSelected = i
                        print("\(itemList[i]) pressed")
                    } label: {
                        Text(itemList[i])
                            .font(.callout)
                            .foregroundColor(currentSelected == i ? .white : .black )
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(currentSelected == i ? .black : .clear)
                    .cornerRadius(12)
                    .scaleEffect()
                }
            }
        }
    }
}

struct CategoryScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScrollView()
    }
}
