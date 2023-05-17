//
//  BleepModel.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import Foundation

class Bleep: Identifiable, ObservableObject {
    @Published var isActive: Bool = true
    @Published var content: String
    @Published var interval: Double
    var prevInterval: Double = 0
    var timer: Timer!
    var id = UUID()
    
    init(content: String, interval: Double) {
        self.content = content
        self.interval = interval
        
//        startInterval()
    }
    
    func startInterval() {
        if self.timer != nil {
            endInterval()
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: self.interval, repeats: true, block: { timer in
            print("\(self.content)!")
            self.sendNotification()
        })
    }
    
    func endInterval() {
        self.timer.invalidate()
    }
    
    func activate() {
        self.isActive = true
    }
    
    func deactivate() {
        self.isActive = false
    }
    
    func sendNotification() {}
}
