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
    @State private var newBleepInterval: Double = 60
    
    var body: some View {
        Form {
            VStack{
                HStack {
                    TextField("", text: $newBleepContent, prompt: Text("Add new bleep..."))
                        .textFieldStyle(.plain)
                        .padding(.leading, -5)
                        .background(Color.clear)
                    
                    Picker("", selection: $newBleepInterval) {
                        ForEach(modelData.intervalOptionsInSecs, id: \.self) { interval in
                            let (hours, mins) = convertSecsToMinsHours(interval)
                            let optionText = """
                            \(hours >= 1
                                ? "\(hours.formatted()) hour\(hours > 1 ? "s" : "")"
                                : "\(mins.formatted()) min\(mins > 1 ? "s" : "")")
                            """
                            
                            Text(optionText).tag(interval)
                        }
                    }.pickerStyle(.menu).frame(width: 90).padding(.leading, -5)
                    
                    Button("Add") {
                        submitHandler(content: newBleepContent, intervalInSeconds: newBleepInterval)
                    }
                }
            }
        }
        .onSubmit {
            submitHandler(content: newBleepContent, intervalInSeconds: newBleepInterval)
        }
        .padding(.vertical, 2)
    }
    
    func intervalInputHandler(mins: Double) {
        newBleepInterval = mins
    }
    
    func submitHandler(content: String, intervalInSeconds: Double) {
        if content.isEmpty || intervalInSeconds == 0 {
            return
        }
        
        
        modelData.addNewBleep(content: content, intervalInSeconds: intervalInSeconds)
        
        newBleepContent = ""
        newBleepInterval = 60
    }
}

struct BleepFormView_Previews: PreviewProvider {
    static var previews: some View {
        BleepFormView()
            .environmentObject(ModelData())
    }
}
