//
//  ContentView.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/17.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            HStack {
                Text("Bleep")
                    .bold()
                
                Spacer()
                
                Toggle("", isOn: $modelData.isAllActive)
                    .toggleStyle(.switch)
                    .tint(.blue)
            }
            
            Divider()
            
            BleepsListView()
            
            Divider()
            
            BleepFormView()
            
            Divider()
            
            Button("Quit Bleep") {
                quitApp()
            }
        }
        .padding()
    }
    
    func quitApp() {
        NSApplication.shared.terminate(nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
