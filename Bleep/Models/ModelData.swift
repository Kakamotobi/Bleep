//
//  ModelData.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import Foundation
import OrderedCollections

final class ModelData: ObservableObject {
    @Published var allBleeps: OrderedDictionary<Double, [Bleep]> = [:]
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
    
    init() {
        allBleeps = intervalOptionsInSecs.reduce(into: [:]) { acc, curr in
            acc[curr] = []
        }
        
        // For preview. Delete this.
        allBleeps[60] = [Bleep(content: "Hello", intervalInSeconds: 60), Bleep(content: "Do something", intervalInSeconds: 60)]
        allBleeps[300] = [Bleep(content: "Stand up", intervalInSeconds: 300)]
        allBleeps[900] = [Bleep(content: "Blah", intervalInSeconds: 900), Bleep(content: "Blahblah", intervalInSeconds: 900)]
    }
    
    func addNewBleep(content: String, intervalInSeconds: Double) {
        let newBleep = Bleep(content: content, intervalInSeconds: intervalInSeconds)
        allBleeps[intervalInSeconds]?.append(newBleep)
    }
    
    func removeBleep(interval: Double, id: UUID) {
        allBleeps[interval] = allBleeps[interval]!.filter {
            $0.id != id
        }
    }
    
    func activateAll() {
        for (_, bleeps) in allBleeps {
            for bleep in bleeps {
                bleep.activate()
            }
        }
    }
    
    func deactivateAll() {
        for (_, bleeps) in allBleeps {
            for bleep in bleeps {
                bleep.deactivate()
            }
        }
    }
}
