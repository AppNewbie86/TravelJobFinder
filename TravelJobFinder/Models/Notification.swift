
import Foundation
import MapKit

// Importieren der benötigten Frameworks

//MARK: MODEL
// Die Notification-Struktur definiert das Modell für eine Benachrichtigung mit den entsprechenden Parametern.

import SwiftUI

struct Notification : Identifiable {
    
    var id = UUID()
    let name : String
    let image : String
    let description : String
    
    // Die Notification-Struktur repräsentiert eine Benachrichtigung und speichert Informationen über die Benachrichtigung.

    // Die Notification-Struktur hat folgende Eigenschaften:
    // - id: Die eindeutige ID der Benachrichtigung
    // - name: Der Name der Benachrichtigung
    // - image: Der Name oder Pfad zum Bild der Benachrichtigung
    // - description: Eine Beschreibung der Benachrichtigung

    // Diese Struktur kann verwendet werden, um Benachrichtigungsobjekte in deiner Anwendung darzustellen und zu verarbeiten.
}


// Erstellen von Instanzen der Aktivitäten-Struct und Speichern in einem Array
var notifications = [Notification(name: "SURFEN", image: "activityimage1",description: "You won't forget that, here are the best and the biggest\nwaves that any adventure surfer will dream to jump in\n.Make your kid interior have fun\nby booking this amazing experince right now !\n"),
                     Notification(name: "Hill HIKING", image: "activityimage3",description: "This is the way! Climb this huge mountain and accomplish\nwhat just couples of human being are able to do,\npass thought your mental and physical obstacle to unlock your potential."),
                     Notification(name: "KAYAK BOAT", image: "activityimage4",description: "Jump into this massive river in high speed\nyour decision is important, you will\nbe in the flow of the life surrended by the\ncliffs. Here you are small and become big\nafter this "),
                     Notification(name: "GUIDE-TOUR", image: "activityimage2",description: "Visit a beautiful and pittoresque city\nhome to century of history ,\naccompagned by the best and passionate local\nguide. You will visit, learn and eat like never.")] as [Any]

