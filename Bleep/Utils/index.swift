//
//  index.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/18.
//

import Foundation

func convertSecsToMinsHours(_ secs: Double) -> (Double,Double) {
    let mins = (secs / 60).rounded()
    let hours = (mins / 60).rounded()
    
    return (hours, mins)
}
