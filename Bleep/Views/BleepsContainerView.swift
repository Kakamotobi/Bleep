//
//  BleepsContainerView.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/07/03.
//

import SwiftUI

struct BleepsContainerView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            let bleepsSections = modelData.allBleeps.filter { key, value in
                return value.count > 0
            }
            
            ForEach(Array(bleepsSections.keys.enumerated()), id: \.offset) { index, interval in
                VStack(alignment: .leading) {
                    if index != 0 {
                        Divider()
                    }
                    
                    Text("\(correspondingTimeUnit(interval))")
                        .padding(.leading, -15)
                        .foregroundStyle(.gray)
                    
                    BleepsSectionView(bleeps: bleepsSections[interval]!)
                }
            }
        }
        .frame(maxHeight: 160)
    }
}

struct BleepsContainerView_Previews: PreviewProvider {
    static var previews: some View {
        BleepsContainerView()
            .environmentObject(ModelData())
    }
}
