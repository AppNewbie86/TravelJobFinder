import Foundation

struct BookingCategory: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let country: String
    let imageName: String
}

// MARK: - Definiert das Modell für eine Buchungskategorie mit Parametern
// Die BookingCategory-Struktur stellt eine Buchungskategorie dar.
// Sie implementiert das Hashable-Protokoll, um in einer Menge verwendet werden zu können,
// und das Identifiable-Protokoll, um eine eindeutige ID für jede Instanz zu haben.

// Die Buchungskategorie hat folgende Eigenschaften:
// - id: Eine eindeutige ID für die Buchungskategorie
// - name: Der Name der Buchungskategorie
// - country: Das Land der Buchungskategorie
// - imageName: Der Name des Bildes, das die Buchungskategorie repräsentiert

// Es können Instanzen der BookingCategory-Struktur erstellt werden, indem die entsprechenden Eigenschaften angegeben werden.



