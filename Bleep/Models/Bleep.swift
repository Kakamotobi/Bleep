//
//  BleepModel.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import Foundation

class Bleep: Identifiable, ObservableObject {
    @Published var isActive: Bool = true {
        didSet {
            if isActive {
                startBleep()
            } else {
                stopBleep()
            }
        }
    }
    @Published var content: String
    @Published var intervalInSeconds: Double
    var id: UUID = UUID()
    var notificationId: String!
    
    init(content: String, intervalInSeconds: Double) {
        self.content = content
        self.intervalInSeconds = intervalInSeconds
        
        startBleep()
    }
    
    func startBleep() {
        if self.notificationId != nil {
            stopBleep()
        }
        
        self.notificationId = UUID().uuidString
        SystemService.generateNotification(content: content, timeInterval: intervalInSeconds, repeats: true, notificationId: self.notificationId)
    }
    
    func stopBleep() {
        SystemService.removeNotificationRepeat(id: self.notificationId)
    }
    
    func activate() {
        self.isActive = true
    }
    
    func deactivate() {
        self.isActive = false
    }
}
