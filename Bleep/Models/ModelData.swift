//
//  ModelData.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var bleeps: [Bleep] = [
        Bleep(content: "fix posture", intervalInSeconds: 60),
        Bleep(content: "eye drops", intervalInSeconds: 300),
        Bleep(content: "stand up", intervalInSeconds: 3600),
        Bleep(content: "take a walk", intervalInSeconds: 7200)
    ]
    @Published var isAllActive: Bool = true {
        didSet {
            if isAllActive {
                activateAll()
            } else {
                deactivateAll()
            }
        }
    }
    var intervalOptionsInSecs: [Double] = [
        60, 120, 300, 600, 900, 1800, 3600, 7200, 10800, 18000
    ]
    
    func addNewBleep(content: String, intervalInSeconds: Double) {
        let newBleep = Bleep(content: content, intervalInSeconds: intervalInSeconds / 60)
        bleeps.append(newBleep)
        sortBleeps()
    }
    
    func removeBleep(id: UUID) {
        bleeps = bleeps.filter {
            $0.id != id
        }
    }
    
    func sortBleeps() {
        bleeps.sort {
            $0.intervalInSeconds < $1.intervalInSeconds
        }
    }
    
    func activateAll() {
        for bleep in bleeps {
            bleep.activate()
        }
    }
    
    func deactivateAll() {
        for bleep in bleeps {
            bleep.deactivate()
        }
    }
}
