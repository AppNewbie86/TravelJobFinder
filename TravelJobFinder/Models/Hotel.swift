
// MARK: definiert das Modell für ein Hotel mit Parametern:

import Foundation

// Es ist Eindeutig Identifiezierbar und Hashable kann in Mengen und Dictonaries eingesetzt werden
struct Hotel: Identifiable , Hashable{
    
    let id = UUID()
    let name: String
    let location: String
    let price: String
    let description: String
    let image: String // Bildname oder URL für das Hotelbild
    let wifi: Bool
}

