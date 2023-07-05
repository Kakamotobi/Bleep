//
//  BleepView.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import SwiftUI

struct BleepView: View {
    @ObservedObject var bleep: Bleep // change to @Binding to allow editting the bleep
    
    var body: some View {
        HStack{
            Text("\(bleep.content)")
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
        BleepView(bleep: modelData.allBleeps[60]![0])
    }
}
