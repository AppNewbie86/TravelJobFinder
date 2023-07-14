import Foundation
import MapKit

// Die TripTypeViewModel-Klasse stellt ein ViewModel für den Trip-Typ dar.

//MARK: MODEL VIEW
@MainActor
class TripTypeViewModel : ObservableObject {
    // Die activities-Eigenschaft enthält eine Liste von Aktivitäten.
    @Published var activities : [Activities] = []
    
    // Die places-Eigenschaft enthält eine Liste von Orten.
    @Published var places : [Places] = []
    
    // Die total-Eigenschaft enthält den Gesamtpreis der Aktivitäten.
    @Published var total : Int = 0
    
    // Die searchText-Eigenschaft wird für die Suche verwendet.
    @Published var searchText : String = ""
    
    // Funktion zum Hinzufügen einer Aktivität zum Warenkorb.
    func addActivities(newItem: Activities) {
        activities.append(newItem)
        total += newItem.price
    }
    
    // Funktion zum Entfernen einer Aktivität aus dem Warenkorb.
    func removeFromCart (newItem: Activities){
        activities = activities.filter{ $0.id != newItem.id}
        total -= newItem.price
    }
}


