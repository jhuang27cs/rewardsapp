//
//  SearchView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/14.
//

import SwiftUI

struct SearchView: View {
    
    @State var inputValue: String = ""
    
    var body: some View {
        HStack {
            TextField(text: $inputValue, prompt: Text("Search stores/rewards")) {
                
            }
            .padding(.horizontal)
            
            Image("search")
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                .background(Color.red)
                .cornerRadius(16)
        }
        .frame(height: 32)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.red, lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
