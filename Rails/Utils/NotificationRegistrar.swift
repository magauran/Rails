//
//  NotificationRegistrar.swift
//  Rails
//
//  Created by Alexey Salangin on 4/11/21.
//

import UIKit

enum NotificationRegistrar {
    static func register() {
        let content = UNMutableNotificationContent()
        content.title = "Your Train is on a delay"
        content.body = "While waiting for it you may have a decent taste of delicious cakes and coffee in Caffessimo in Napoli Centrale."
        content.badge = 1

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)

        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(
            identifier: uuidString,
            content: content,
            trigger: trigger
        )

        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request, withCompletionHandler: nil)
    }
}
