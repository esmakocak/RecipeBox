//
//  NotificationManager.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 30.07.2024.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager() // Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        
        guard let randomRecipe = Recipe.all.randomElement() else {
            print("No recipes available.")
            return
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Time to cook!"
        content.subtitle = "Let's try the \(randomRecipe.name) you saved."
        content.sound = .default
        
        
        // MARK: Calendar Based Trigger
        var dateComponents = DateComponents()
        dateComponents.hour = 17
        dateComponents.minute = 56
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            }
        }
        
        
        func setupDailyNotifications() {
            // Cancel all existing notifications
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

            scheduleNotification()
        }
        
    }
    
}
