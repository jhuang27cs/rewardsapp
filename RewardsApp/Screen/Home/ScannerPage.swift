//
//  ScannerView.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/16.
//

import SwiftUI

struct ScannerPage: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        VStack {
            ScannerView(scannedCode: $viewModel.scannedCode,
                        alertItem: $viewModel.alertItem)
            .frame(maxWidth: .infinity, maxHeight: 300)
            Spacer().frame(height: 60)
            Label("Scanned QR:", systemImage: "qrcode.viewfinder")
                .font(.title)
            
            Text(viewModel.statusText)
                .bold()
                .font(.largeTitle)
                .foregroundColor(viewModel.statusTextColor)
                .padding()
        }
    }
}

struct ScannerPage_Previews: PreviewProvider {
    static var previews: some View {
        ScannerPage()
    }
}
