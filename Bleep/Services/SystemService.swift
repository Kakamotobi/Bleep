//
//  SystemService.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/18.
//

import Foundation
import SwiftUI

struct SystemService {
    static func requestAllowNotification() {
        print("allow notification")
    }

    static func quitApp() {
        NSApplication.shared.terminate(nil)
    }
}
