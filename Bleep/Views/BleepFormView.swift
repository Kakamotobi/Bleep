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
    @State private var newBleepInterval: Double = 0
    
    var body: some View {
        Form {
            VStack{
                Section {
                    TextField("", text: $newBleepContent, prompt: Text("Add new bleep"))
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Menu("Interval") {
                        ForEach(modelData.intervalOptionsInSecs, id: \.self) { interval in
                            let (hours, mins) = convertSecsToMinsHours(interval)
                            let buttonText = """
                            \(hours >= 1
                                ? "\(hours.formatted()) hour\(hours > 1 ? "s" : "")"
                                : "\(mins.formatted()) min\(mins > 1 ? "s" : "")")
                            """
                            
                            Button("\(buttonText)", action: {
                                self.intervalInputHandler(mins: interval)
                            })
                                .onTapGesture {
                                    newBleepInterval = interval
                                }
                        }
                    }
                    
                    Button("Add") {
                        submitHandler(content: newBleepContent, intervalInSeconds: newBleepInterval)
                    }
                }
            }
        }
        .onSubmit {
            submitHandler(content: newBleepContent, intervalInSeconds: newBleepInterval)
        }
    }
    
    func intervalInputHandler(mins: Double) {
        newBleepInterval = mins
    }
    
    func submitHandler(content: String, intervalInSeconds: Double) {
        if content.isEmpty || intervalInSeconds == 0 {
            return
        }
        
        // Add new bleep
        modelData.addNewBleep(content: content, intervalInSeconds: intervalInSeconds)
        // Reset values
        newBleepContent = ""
        newBleepInterval = 0
    }
}

struct BleepFormView_Previews: PreviewProvider {
    static var previews: some View {
        BleepFormView()
            .environmentObject(ModelData())
    }
}
