//
//  BleepFormView.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/18.
//

import SwiftUI

struct BleepFormView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var newBleepContent: String = ""
    @State private var newBleepInterval: Double = 1
    
    var body: some View {
        Form {
            VStack{
                Section {
                    TextField("", text: $newBleepContent, prompt: Text("Add new bleep"))
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Stepper(value: $newBleepInterval, in: 1...1440) {
                        TextField("Mins:", value: $newBleepInterval, formatter: NumberFormatter(), prompt: Text("Add new bleep"))
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Add") {
                        submitHandler(content: newBleepContent, interval: newBleepInterval)
                    }
                }
            }
        }
        .onSubmit {
            submitHandler(content: newBleepContent, interval: newBleepInterval)
        }
    }
    
    func submitHandler(content: String, interval: Double) {
        if content.isEmpty || interval <= 0 || interval >= 1440 {
            return
        }
        
        // Add new bleep
        modelData.addNewBleep(content: content, interval: interval)
        // Reset values
        newBleepContent = ""
        newBleepInterval = 1
    }
}

struct BleepFormView_Previews: PreviewProvider {
    static var previews: some View {
        BleepFormView()
    }
}
