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
    @FocusState private var isFocused: Bool

    var body: some View {
        Form {
            HStack {
                TextField("", text: $newBleepContent, prompt: Text("Add new bleep..."))
                    .focused($isFocused)
                    .padding(.leading, -5)
                    .textFieldStyle(.plain)
                    .background(Color.clear)

                Picker("", selection: $newBleepInterval) {
                    ForEach(modelData.intervalOptionsInSecs, id: \.self) { interval in
                        Text(correspondingTimeUnit(interval)).tag(interval)
                    }
                }
                    .frame(width: 90)
                    .padding(.leading, -5)
                    .pickerStyle(.menu)

                Button("Add") {
                    submitHandler(content: newBleepContent, intervalInSeconds: newBleepInterval)
                    isFocused = false
                }
            }
        }
        .onSubmit {
            submitHandler(content: newBleepContent, intervalInSeconds: newBleepInterval)
            isFocused = false
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isFocused = false
            }
        }
        .padding(.vertical, 2)
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
