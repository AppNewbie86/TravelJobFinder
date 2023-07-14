import Foundation

struct FlightDetails: Identifiable {
    let id = UUID()
    let place: String
    let code: String
    let timing: String
}

// MARK: - Definiert das Modell für FlightDetails mit Parametern
// Die FlightDetails-Struktur stellt ein einzelnes Flugdetail dar und implementiert das Identifiable-Protokoll.

// Die FlightDetails-Struktur hat folgende Eigenschaften:
// - id: Die eindeutige ID des Flugdetails, die mit einer UUID generiert wird
// - place: Der Ort des Flugs
// - code: Der Code des Flugs
// - timing: Die Zeit des Flugs

// Die Struktur implementiert das Identifiable-Protokoll, um die Identifizierung des Flugdetails zu ermöglichen.

