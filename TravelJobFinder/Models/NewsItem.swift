import Foundation

struct NewsItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

// MARK: - Definiert das Modell für ein NewsItem mit Parametern
// Die NewsItem-Struktur stellt ein einzelnes News-Element dar und implementiert die Identifiable- und Hashable-Protokolle.

// Die NewsItem-Struktur hat folgende Eigenschaften:
// - id: Die eindeutige ID des News-Elements, die mit einer UUID generiert wird
// - title: Der Titel des News-Elements

// Die Struktur implementiert das Identifiable-Protokoll, um die Identifizierung des News-Elements zu ermöglichen,
// und das Hashable-Protokoll, um die Verwendung in Sets und Dictionaries zu ermöglichen.

