
import Foundation


struct Hotel: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let price: String
    let description: String
    let imageName: String // Bildname oder URL für das Hotelbild
    let wifi: Bool
}
