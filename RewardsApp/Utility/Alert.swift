//
//  Alert.swift
//  RewardsApp
//
//  Created by Jie Huang on 2023/9/16.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device input", message: "Something is wrong with the camera.", dismissButton: .default(Text("OK")))
    static let invalidScannedType = AlertItem(title: "Invalid Device input", message: "The value scanned is not valid. This app scans EAN-8 and EAN-13", dismissButton: .default(Text("OK")))
}
