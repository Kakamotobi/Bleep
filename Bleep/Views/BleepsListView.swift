//
//  BleepsList.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import SwiftUI

struct BleepsListView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        List {
            ForEach(modelData.bleeps) {bleep in
                BleepView(bleep: bleep)
            }
        }.border(.green)
    }
}

struct BleepsList_Previews: PreviewProvider {
    @State static var bleeps = [Bleep(content: "stand up", interval: 2)]
    
    static var previews: some View {
        BleepsListView()
            .environmentObject(ModelData())
    }
}
