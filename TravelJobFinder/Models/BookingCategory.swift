import Foundation

struct BookingCategory: Hashable,Identifiable {
    var id = UUID()
    let name: String
    let country: String
    let imageName: String
}



import Foundation
import SwiftUI

struct BookingCategories : Hashable {
    let name, imageName: String
}
