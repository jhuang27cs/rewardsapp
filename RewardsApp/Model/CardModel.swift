//
//  CardModel.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/14.
//

import Foundation

struct CardModel: Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var backgroundImage: String
    var isMarked: Bool = false
    var totalCheckMarks: Int
    var checkMarks: Int = 0
    var date: Date
    var distance: Int
}


struct MockData {
    static func cards() -> [CardModel] {
        return [CardModel(id: 001, name: "Will Spa", imageName: "willspa", backgroundImage: "willspa_bg", totalCheckMarks: 8, date: Date(), distance: 100),
                CardModel(id: 002, name: "Will Spa", imageName: "willspa", backgroundImage: "willspa_bg", totalCheckMarks: 8, date: Date(), distance: 100),
                CardModel(id: 003, name: "Will Spa", imageName: "willspa", backgroundImage: "willspa_bg", totalCheckMarks: 8, date: Date(), distance: 100),
                CardModel(id: 004, name: "Will Spa", imageName: "willspa", backgroundImage: "willspa_bg", totalCheckMarks: 8, date: Date(), distance: 100)
        ]
    }
    
    static func singleCard() -> CardModel {
        return CardModel(id: 001, name: "Will Spa", imageName: "willspa", backgroundImage: "willspa_bg", totalCheckMarks: 8, date: Date(), distance: 100)
    }
}
