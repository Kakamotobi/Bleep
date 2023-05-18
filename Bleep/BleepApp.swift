//
//  BleepApp.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import SwiftUI

@main
struct BleepApp: App {
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        MenuBarExtra("Bleep", systemImage: "timer") {
            ContentView()
                .environmentObject(modelData)
        }.menuBarExtraStyle(.window)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    @MainActor func applicationDidFinishLaunching(_ notification: Notification) {
        if SystemService.isNotificationPermissionGranted() == false {
            SystemService.requestNotificationPermission()
        }
    }
    
    @MainActor func applicationWillTerminate(_ notification: Notification) {
        SystemService.UNCenter.removeAllPendingNotificationRequests()
        SystemService.UNCenter.removeAllDeliveredNotifications()
    }
}
