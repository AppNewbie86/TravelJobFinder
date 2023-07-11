
import Foundation


struct Hotel: Identifiable , Hashable{
    let id = UUID()
    let name: String
    let location: String
    let price: String
    let description: String
    let image: String // Bildname oder URL für das Hotelbild
    let wifi: Bool
}

