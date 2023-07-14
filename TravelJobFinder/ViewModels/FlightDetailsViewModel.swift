import Foundation

// Die FlightDetailsViewModel-Klasse repräsentiert ein ViewModel für die Flugdetails.

@MainActor
class FlightDetailsViewModel: ObservableObject {
    // Die departureFlight-Eigenschaft enthält die Flugdetails für den Abflug.
    @Published var departureFlight = FlightDetails(place: "London", code: "LON", timing: "23. Nov, 23.00 Uhr")
    
    // Die arrivalFlight-Eigenschaft enthält die Flugdetails für die Ankunft.
    @Published var arrivalFlight = FlightDetails(place: "Las Vegas", code: "LAV", timing: "23. Nov, 13.15 Uhr")
    
    // Die confirmSelection-Funktion wird aufgerufen, um die Flugauswahl zu bestätigen.
    func confirmSelection() {
        print("Selection confirmed!")
        // Hier können beliebige Aktionen nach der Bestätigung durchgeführt werden.
    }
}

// sampleCards enthält eine Liste von Card-Objekten.
let sampleCards = [
    Card(id: 0, cardImage: "Card 1"),
    Card(id: 1, cardImage: "Card 2"),
    Card(id: 2, cardImage: "Card 4"),
    Card(id: 2, cardImage: "Card 5"),
    Card(id: 2, cardImage: "Card 6")
]
