//
//  BleepsList.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import SwiftUI

struct BleepsSectionView: View {
    var bleeps: [Bleep]
    
    var body: some View {
        VStack {
            ForEach(bleeps) { bleep in
                BleepView(bleep: bleep)
            }
        }
    }
}

struct BleepsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        BleepsSectionView(bleeps: [Bleep(content: "hello", intervalInSeconds: 60)])
    }
}
