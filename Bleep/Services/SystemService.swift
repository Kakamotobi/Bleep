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
        print("removed notification!")
    }
    
    static func isNotificationPermissionGranted() -> Bool {
        var isGranted: Bool = false
        UNCenter.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                isGranted = true
            }
        }
        return isGranted
    }
    
    static func requestNotificationPermission() {
        UNCenter.getNotificationSettings { settings in
            var requiredNotificationPermission: Bool!
            
            if settings.authorizationStatus == .denied || settings.authorizationStatus == .notDetermined {
                requiredNotificationPermission = true
            } else {
                requiredNotificationPermission = false
            }
            
            UNCenter.requestAuthorization(options: [.alert, .sound, .provisional]) { granted, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                
                if requiredNotificationPermission && granted {
                    generateNotification(content: "You will now receive bleeps!", timeInterval: 1, repeats: false, notificationId: UUID().uuidString)
                } else if !granted {
                    generateNotification(content: "You need to allow notifications to receive bleeps!", timeInterval: 1, repeats: false, notificationId: UUID().uuidString)
                }
            }
        }
    }

    static func quitApp() {
        NSApplication.shared.terminate(nil)
    }
}
