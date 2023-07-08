
import SwiftUI

class HotelViewModel: ObservableObject {
    @Published var hotels: [Hotel]

       init() {
           self.hotels = [
               Hotel(name: "Hilton", location: "London", price: "$200", description: "Luxuriöses Hotel im Herzen von London", imageName: "hotel1", wifi: true),
               Hotel(name: "Marriott", location: "New York", price: "$250", description: "Exquisites Hotel in der pulsierenden Stadt New York", imageName: "hotel2", wifi: false)
           ]
       }
    
    
    func bookHotel(_ hotel: Hotel) {
            // Hier kannst du die Logik für die Buchung des Hotels implementieren
            print("Hotel \(hotel.name) wurde gebucht.")
        }

        // Funktion zum Löschen einer Hotelbuchung
        func deleteBooking(_ hotel: Hotel) {
            // Füge hier die Logik zum Löschen einer Buchung hinzu
            print("Buchung des Hotels \(hotel.name) wurde gelöscht.")
        }

        // Funktion zum Aktualisieren einer Hotelbuchung
        func updateBooking(_ hotel: Hotel) {
            // Füge hier die Logik zum Aktualisieren einer Buchung hinzu
            print("Buchung des Hotels \(hotel.name) wurde aktualisiert.")
        }


    }
