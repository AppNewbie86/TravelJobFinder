import Foundation
import MapKit

// Die NotificationViewModel-Klasse stellt ein ViewModel für Benachrichtigungen dar.

@MainActor
class NotificationViewModel: ObservableObject {
    // Die notifications-Eigenschaft enthält eine Liste von Benachrichtigungen.
    @Published var notifications: [Notification] = []
    
    // Die total-Eigenschaft enthält die Gesamtzahl der Benachrichtigungen.
    @Published var total: Int = 0
    
    // Die addNotification-Funktion fügt eine Benachrichtigung zur Liste hinzu.
    func addNotification(notification: Notification) {
        notifications.append(notification)
    }
}
