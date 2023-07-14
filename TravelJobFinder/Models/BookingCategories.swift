import Foundation
import SwiftUI

struct BookingCategories : Hashable {
    let name, imageName: String
}

// MARK: - Erstellen weiterer Instanzen der BookingCategories-Struktur und Speichern in Variablen
private var category1 = BookingCategories(name: "Flights", imageName: "flights")
private var category2 = BookingCategories(name: "Hotels", imageName: "hotels")
private var category3 = BookingCategories(name: "Activities", imageName: "activities")

struct BookingCategoriesModel {
    var categoriesList : [BookingCategories] = [category1, category2, category3]
}
