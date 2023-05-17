//
//  BleepApp.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import SwiftUI

@main
struct BleepApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        MenuBarExtra("Bleep", systemImage: "timer") {
            ContentView()
                .environmentObject(modelData)
        }.menuBarExtraStyle(.window)
    }
}
