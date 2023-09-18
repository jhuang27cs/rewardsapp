//
//  ScannerView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/16.
//

import SwiftUI
import AVFoundation

struct ScannerPage: View {
    
    @ObservedObject var viewModel: BarcodeScannerViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            ScannerView(scannedCode: $viewModel.scannedCode,
                        alertItem: $viewModel.alertItem)
            VStack {
                HStack {
                    ZStack {
                        Rectangle()
                            .background(.white)
                            .opacity(0.5)
                            .frame(width: 41, height: 41)
                            .cornerRadius(12)
                        Image("back_arrow")
                            .resizable()
                            .frame(width: 19, height: 19)
                    }
                    .frame(width: 41, height: 41)
                    .onTapGesture {
                        self.presentation.wrappedValue.dismiss()
                    }
                    Spacer()
                    Text("Scan")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.leading, -41)
                    Spacer()
                }
                .padding(.horizontal, 24)
                Spacer()
            }
            .padding(.top, 56)
            MovingLine()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .onChange(of: viewModel.scannedCode) { newValue in
            if newValue != "" {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

struct MovingLine: View {

  @State private var lineY = -200.0

  var body: some View {

    ZStack {
        
        HStack {
          LinearGradient(gradient:
                            Gradient(colors: [Color(uiColor: UIColor(red: 0.88, green: 0.41, blue: 0.15, alpha: 0)),
                                              Color(uiColor: UIColor(red: 0.88, green: 0.41, blue: 0.15, alpha: 1)),
                                              Color(uiColor: UIColor(red: 0.88, green: 0.41, blue: 0.15, alpha: 0))]),
                         startPoint: .leading,
                         endPoint: .trailing)
          .frame(height: 5)
          .offset(y: lineY)
        }

      Color.clear.onAppear {
          withAnimation(Animation.linear(duration: 2.5).repeatForever(autoreverses: false)) {
          self.lineY = 300
        }
      }

    }
  }

}

//struct ScannerPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ScannerPage()
//    }
//}
