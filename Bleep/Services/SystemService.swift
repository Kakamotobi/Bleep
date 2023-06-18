//
//  SystemService.swift
//  Bleep
//
//  Created by Daeram Chung on 2023/05/18.
//

import Foundation
import SwiftUI
import UserNotifications

struct SystemService {
    static let UNCenter = UNUserNotificationCenter.current()
    
    static func generateNotification(content: String, timeInterval: Double, repeats: Bool, notificationId: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Bleep"
        notificationContent.body = content
        notificationContent.sound = UNNotificationSound.default
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
        
        let notificationRequest = UNNotificationRequest(identifier: notificationId, content: notificationContent, trigger: notificationTrigger)
        
        UNCenter.add(notificationRequest) {error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
        }
    }
    
    static func removeNotificationRepeat(id: String) {
        UNCenter.removePendingNotificationRequests(withIdentifiers: [id])
    }
    
    static func isNotificationPermissionGranted(completionHandler: @escaping (Bool) -> Void) {
        UNCenter.getNotificationSettings { (settings) in
            let isGranted = settings.authorizationStatus == .authorized
            completionHandler(isGranted)
        }
    }
    
    static func requestNotificationPermission() {
        UNCenter.getNotificationSettings { settings in
            UNCenter.requestAuthorization(options: [.alert, .sound, .provisional]) { granted, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                
                if granted {
                    generateNotification(content: "You will now receive bleeps!", timeInterval: 1, repeats: false, notificationId: UUID().uuidString)
                } else {
                    generateNotification(content: "You need to allow notifications to receive bleeps!", timeInterval: 1, repeats: false, notificationId: UUID().uuidString)
                }
            }
        }
    }

    static func quitApp() {
        UNCenter.removeAllPendingNotificationRequests()
        NSApplication.shared.terminate(nil)
    }
}
