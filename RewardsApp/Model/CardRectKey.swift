//
//  CardRectKey.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/14.
//

import SwiftUI

struct CardRectKey: PreferenceKey {
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    
    static func reduce(value: inout [String : Anchor<CGRect>], nextValue: () -> [String : Anchor<CGRect>]) {
        value.merge(nextValue()) { $1 }
    }
}
