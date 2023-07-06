//
//  BleepView.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import SwiftUI

struct BleepView: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var bleep: Bleep // change to @Binding to allow editting the bleep
    @State var isHovered: Bool = false
    
    var body: some View {
        HStack {
            HStack {
                Text("\(bleep.content)")
                    .frame(maxWidth: 180, alignment: .leading)
                
                Spacer()
                
                if isHovered {
                    Button("🗑️") {
                        modelData.removeBleep(bleep)
                    }
                    .buttonStyle(.plain)
                    .opacity(isHovered ? 1.0 : 0.0)
                }
            }
            .onHover { over in
                withAnimation(.easeInOut(duration: 0.25)) {
                    isHovered = over
                }
            }
            
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
