import Foundation
import SwiftUI

// Die CartViewModel-Klasse repräsentiert ein ViewModel für den Warenkorb.

class CartViewModel: ObservableObject {
    // Die items-Eigenschaft enthält eine Liste von Flights-Objekten im Warenkorb.
    @Published var items: [Flights] = []
    
    // Die total-Eigenschaft enthält die Gesamtsumme der Preise aller Flights im Warenkorb.
    @Published var total: Int = 0

    // Die addFlightItem-Funktion fügt ein Flights-Objekt zum Warenkorb hinzu und aktualisiert die Gesamtsumme.
    func addFlightItem(_ item: Flights) {
        items.append(item)
        total += item.price
    }

    // Die removeItem-Funktion entfernt ein Flights-Objekt aus dem Warenkorb und aktualisiert die Gesamtsumme.
    func removeItem(_ item: Flights) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
            total -= item.price
        }
    }
}
