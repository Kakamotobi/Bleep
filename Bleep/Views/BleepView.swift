//
//  BleepView.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import SwiftUI

struct BleepView: View {
    @ObservedObject var bleep: Bleep
    
    var body: some View {
        let (hours, mins) = convertSecsToMinsHours(bleep.intervalInSeconds)
        let bleepText = """
            \(bleep.content) - every \(hours >= 1
                ? "\(hours.formatted()) hour\(hours > 1 ? "s" : "")"
                : "\(mins.formatted()) min\(mins > 1 ? "s" : "")")
        """
        
        HStack{
            Text("\(bleepText)")
            Spacer()
            Toggle("", isOn: $bleep.isActive)
                .toggleStyle(.switch)
                .tint(.blue)
        }
    }
}

struct BleepView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        BleepView(bleep: modelData.bleeps[0])
    }
}
