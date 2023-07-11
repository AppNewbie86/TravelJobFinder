
import SwiftUI
import Foundation
import Combine
import MapKit
@MainActor
class HotelViewModel: ObservableObject {
    // Manipulierbare Variable hotels von Hotel
    @Published var hotels: [Hotel]
    
    // Initialisierung der Fake Hotels
    init() {
        self.hotels = [
            Hotel(name: "Hilton", location: "London", price: "$200", description: "Luxuriöses Hotel im Herzen von London", image: "hotel1", wifi: true),
            Hotel(name: "Marriott", location: "New York", price: "$250", description: "Exquisites Hotel in der pulsierenden Stadt New York", image: "hotel2", wifi: false)
        ]
    }
    // Function zum Hotel buchen
    
    func bookHotel(_ hotel: Hotel) {
        // Hier kannst du die Logik für die Buchung des Hotels implementieren
        print("Hotel \(hotel.name) wurde gebucht.")
    }
    // Function zum Hotel Buchung löschen

    func removeFromCart(newItem: Hotel) {
            // implementation to remove the item from the cart
        }

    // Funktion zum Aktualisieren einer Hotelbuchung
    func updateBooking(_ hotel: Hotel) {
        // Füge hier die Logik zum Aktualisieren einer Buchung hinzu
        print("Buchung des Hotels \(hotel.name) wurde aktualisiert.")
    }
}
