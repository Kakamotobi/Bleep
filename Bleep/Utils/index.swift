//
//  index.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/18.
//

import Foundation

func convertSecsToMinsHours(_ secs: Double) -> (Double,Double) {
    let mins = (secs / 60).rounded(.towardZero)
    let hours = (mins / 60).rounded(.towardZero)
    
    return (hours, mins)
}

func correspondingTimeUnit(_ secs: Double) -> String {
    let (hours, mins) = convertSecsToMinsHours(secs)
    
    return """
        \(hours >= 1
            ? "\(hours.formatted()) hour\(hours > 1 ? "s" : "")"
            : "\(mins.formatted()) minute\(mins > 1 ? "s" : "")")
    """
}
