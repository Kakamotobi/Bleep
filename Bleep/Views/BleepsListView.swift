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
        }
    }
}

struct BleepsList_Previews: PreviewProvider {
    static var previews: some View {
        BleepsListView()
            .environmentObject(ModelData())
    }
}
