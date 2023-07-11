import Foundation
import SwiftUI

//MARK: MODEL VIEW
@MainActor
class HolidayBookingViewModel: ObservableObject {
    @Published var holidayList: [Holiday] = HolidayModel().holidaysList
    @Published var holidays: [Holiday] = []

    @Published var total: Int = 0
    @Published var searchText: String = ""

    // Reisebestandteile
    @Published var selectedFlight: Flights?
    @Published var selectedHotel: Hotel?
    @Published var selectedEvents: [Events] = []

    // Funktion zum Hinzufügen der Reisebestandteile
    
    // Flug wählen

    func addFlight(_ flight: Flights) {
        selectedFlight = flight
    }
    // Hotel wählen
    
    func addHotel(_ hotel: Hotel) {
        selectedHotel = hotel
    }
    // Event wählen

    func addEvent(_ event: Events) {
        selectedEvents.append(event)
    }

    // Funktion zum Hinzufügen einer Reise
    
    func addHoliday(_ holiday: Holiday) {
        holidays.append(holiday)
        total += holiday.price
    }

    // Funktion zum Entfernen einer Reise
    
    func removeHoliday(_ holiday: Holiday) {
        holidays = holidays.filter { $0.id != holiday.id }
        total -= holiday.price
    }
}
