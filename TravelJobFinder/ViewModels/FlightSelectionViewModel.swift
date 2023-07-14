
import Foundation
import SwiftUI

@MainActor
class FlightSelectionViewModel: ObservableObject {
    @Published var departurePlace: String = ""
    @Published var departureCode: String = ""
    @Published var departureTiming: String = ""
    @Published var arrivalPlace: String = ""
    @Published var arrivalCode: String = ""
    @Published var arrivalTiming: String = ""
    
    init() {
            departurePlace = "London"
            departureCode = "LON"
            departureTiming = "23. Nov, 23.00 Uhr"
            arrivalPlace = "Las Vegas"
            arrivalCode = "LAV"
            arrivalTiming = "23. Nov, 13.15 Uhr"
        }
}

