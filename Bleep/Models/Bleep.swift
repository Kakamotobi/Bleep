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
                 startInterval()
            } else {
                 endInterval()
            }
        }
    }
    @Published var content: String
    @Published var intervalInSeconds: Double
    var prevIntervalInSeconds: Double = 0
    var timer: Timer!
    var id = UUID()
    
    init(content: String, intervalInSeconds: Double) {
        self.content = content
        self.intervalInSeconds = intervalInSeconds
        
        startInterval()
    }
    
    func startInterval() {
        if self.timer != nil {
            endInterval()
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: self.intervalInSeconds, repeats: true, block: { timer in
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
    
    func sendNotification() {
        print("\(self.content)!")
    }
}
