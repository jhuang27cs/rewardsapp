//
//  CardView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/14.
//

import SwiftUI

struct CardView: View {
    var card: CardModel
    var body: some View {
        GeometryReader {_ in 
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 160)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.82, green: 0.56, blue: 0.33), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.86, green: 0.71, blue: 0.56), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.58, y: 0),
                                endPoint: UnitPoint(x: 0.18, y: 1)
                            )
                        )
                    Image(card.backgroundImage)
                        .resizable()
                        .foregroundColor(.white)
                    VStack {
                        HStack {
                            Image(card.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 48, height: 48)
                            Text(card.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                print("marked")
                            } label: {
                                Image(card.isMarked ? "marked" : "mark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                            }
                        }
                        HStack {
                            ForEach(0 ..< card.totalCheckMarks, id: \.self) { i in
                                Image(i+1 <= card.checkMarks ? "check" : "uncheck")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                            Spacer()
                        }
                        HStack(spacing: 0) {
                            Image("calendar")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(.trailing, 4)
                            Text(card.date.formatted(.dateTime.day().month().year()))
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            Spacer()
                            Image("location")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("\(card.distance) m")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(16)
                }
                .frame(height: 160)
                .cornerRadius(24)
            }
//            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MockData.singleCard())
    }
}
