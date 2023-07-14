
import Foundation

struct HolidayItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

// MARK: - Definiert das Modell für ein HolidayItem mit Parametern
// Die HolidayItem-Struktur stellt ein einzelnes Urlaubsobjekt dar und implementiert die Identifiable- und Hashable-Protokolle.

// Die HolidayItem-Struktur hat folgende Eigenschaften:
// - id: Die eindeutige ID des Urlaubsobjekts, die mit einer UUID generiert wird
// - title: Der Titel des Urlaubsobjekts

// Die Struktur implementiert das Identifiable-Protokoll, um die Identifizierung des Urlaubsobjekts zu ermöglichen,
// und das Hashable-Protokoll, um die Verwendung in Sets und Dictionaries zu ermöglichen.

