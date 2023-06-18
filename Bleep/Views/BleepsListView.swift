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
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(modelData.bleeps) {bleep in
                    BleepView(bleep: bleep)
                }
            }
        }.frame(maxHeight: 155)
    }
}

struct BleepsList_Previews: PreviewProvider {
    static var previews: some View {
        BleepsListView()
            .environmentObject(ModelData())
    }
}
