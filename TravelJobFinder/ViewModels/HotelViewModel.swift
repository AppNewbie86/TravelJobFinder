
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
            Hotel(name: "Hilton", location: "London", price: "$400", description: "Luxuriöses Hotel im Herzen von London mit nur wenigen Minuten Fussweg in die City von London. Hier können Sie viele Sehenswürdigkeiten ansehen und auch Einkaufen ist kein Problem. Kränkhäuser und Ärzte sind alle in der Umgebung ansessig", image: "hotel1", wifi: true),
            Hotel(name: "Marriott", location: "New York", price: "$599", description: "Luxoriöses Hotel über den Dächern von New York. Die großen Zimmer lassen den Gast entspannen und Sorgen für ausreichend Platz. Die vielfältige Auswahl im Hotelzimmer Kühlschrank sind immer frisch und ein wahrer Genuss.", image: "hotel2", wifi: false),
            Hotel(name: "Beverly Hills", location: "Greece", price: "$389", description: "Ländliches Hotel an Küstennähe. Hier können Sie jedentag bei schönem Wetter bis an die türkische Küste sehen. Das nahe gelegene Meer bietet eine Menge Familien Aktivitäten", image: "hotel3", wifi: true),
            Hotel(name: "Casa State Hotel", location: "Chigago", price: "$444", description: "Schönes Hotel in der pulsierenden Stadt Chigago. Hier erleben Sie den Lifestyle , und Leben der USA hautnah. Ich verspreche ihnen das dieser Reisetrip für Sie ein einmaliges Erlebnis sein wird.", image: "hotel4", wifi: false),
            Hotel(name: "Cummalabree Hotel", location: "Texas", price: "$170", description: "Traumhaftes Hotel im Herzen von Texas, hier haben Sie direkten Kontakt mit den Einheimischen des Landes. Es ist zwar ein sehr armes Land aber die Menschen bringen den Touristen eine Sehr große Gastfreundschaft entgegen", image: "hotel5", wifi: true),
            Hotel(name: "Vance Baggle Hotel", location: "Columbia USA", price: "$333", description: "Dieses wunderbare und doch alte Hotel in der pulsierenden Hauptstadt von Columbia machen diese Reise für sie unvergesslich. Die vielen Stände und Märkte auf dem Marktplatz zeigen das Columische Leben hautnah", image: "hotel6", wifi: false),
            Hotel(name: "Skyland Hotel", location: "Las Vegas", price: "$666", description: "Luxuriöses Hotel im Zentrum von beeindruckenden Location der Menge Casinos was sie nur aus dem Fernsehen her kennen. Ausser Casinos gibt es auch noch eine Menge andere schöne Orte zu besichtigen", image: "hotel7", wifi: true),
            Hotel(name: "Mountain Duke Hotel", location: "Alaska", price: "$999", description: "Das Naturgelegene Hotel ist nur mit den Huskys und dem Schlitten zu erreichen aber genau das ist das marken Zeichen der Familie Goldstein die Deutscher Abstammung sind aber vor 25 Jahren sich ihren Lebenstraum erfüllten und ein Hotel in Alaska eröffneten", image: "hotel8", wifi: false)
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
