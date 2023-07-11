import Foundation
import MapKit
@MainActor
class NotificationViewModel: ObservableObject {
    @Published var notifications: [Notification] = []
    @Published var total: Int = 0
    
    func addNotification(notification: Notification) {
        notifications.append(notification)
    }
}
