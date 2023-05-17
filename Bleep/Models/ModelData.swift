//
//  ModelData.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var bleeps: [Bleep] = [
        Bleep(content: "fix posture", interval: 5),
        Bleep(content: "stand up", interval: 60),
        Bleep(content: "walk around", interval: 500)
    ]
    @Published var isAllActive: Bool = true
    
    func addNewBleep(content: String, interval: Double) {
        let newBleep = Bleep(content: content, interval: interval / 60)
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
            $0.interval < $1.interval
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
