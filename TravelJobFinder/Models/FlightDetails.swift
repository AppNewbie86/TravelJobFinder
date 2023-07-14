
import Foundation

struct FlightDetails: Identifiable {
    let id = UUID()
    let place: String
    let code: String
    let timing: String
}
