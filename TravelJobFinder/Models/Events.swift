import Foundation
import SwiftUI

struct Events : Identifiable {
    
    var id = UUID()
    let name : String
    let image : String
    let eventdescription : String
    let eventprice : Int
    let eventduration : String
    let eventTime : String
    let eventarrivalTime : String
    let eventorigin : String
    
    // MARK: - Definiert das Modell für ein Ereignis mit Parametern
    // Die Events-Struktur repräsentiert ein Ereignis und speichert Informationen über das Ereignis.

    // Die Events-Struktur hat folgende Eigenschaften:
    // - id: Die eindeutige ID des Ereignisses
    // - name: Der Name des Ereignisses
    // - image: Der Name oder Pfad zum Bild des Ereignisses
    // - eventdescription: Eine Beschreibung des Ereignisses
    // - eventprice: Der Preis des Ereignisses
    // - eventduration: Die Dauer des Ereignisses
    // - eventTime: Die Zeit des Ereignisses
    // - eventarrivalTime: Die Ankunftszeit des Ereignisses
    // - eventorigin: Der Ursprung des Ereignisses

    // Diese Struktur kann verwendet werden, um Ereignisobjekte in deiner Anwendung darzustellen und zu verarbeiten.
}
