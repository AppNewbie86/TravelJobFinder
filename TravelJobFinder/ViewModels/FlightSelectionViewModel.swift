import Foundation
import SwiftUI

// Die FlightSelectionViewModel-Klasse stellt ein ViewModel für die Flugauswahl dar.

@MainActor
class FlightSelectionViewModel: ObservableObject {
    // Die departurePlace-Eigenschaft enthält den Abflugort.
    @Published var departurePlace: String = ""
    
    // Die departureCode-Eigenschaft enthält den Abflugcode.
    @Published var departureCode: String = ""
    
    // Die departureTiming-Eigenschaft enthält die Abflugzeit.
    @Published var departureTiming: String = ""
    
    // Die arrivalPlace-Eigenschaft enthält den Ankunftsort.
    @Published var arrivalPlace: String = ""
    
    // Die arrivalCode-Eigenschaft enthält den Ankunftcode.
    @Published var arrivalCode: String = ""
    
    // Die arrivalTiming-Eigenschaft enthält die Ankunftszeit.
    @Published var arrivalTiming: String = ""
    
    // Initialisierung der Eigenschaften mit Standardwerten.
    init() {
        departurePlace = "London"
        departureCode = "LON"
        departureTiming = "23. Nov, 23.00 Uhr"
        arrivalPlace = "Las Vegas"
        arrivalCode = "LAV"
        arrivalTiming = "23. Nov, 13.15 Uhr"
    }
}
