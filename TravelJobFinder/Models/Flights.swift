// MARK: - definiert das Modell Flights mit ihren Parametern

import Foundation
import SwiftUI

// Die Flights-Struktur definiert das Modell für einen Flug mit den entsprechenden Parametern.

struct Flights : Identifiable {
    var id = UUID()
    let name : String
    let image : String
    let description : String
    let price : Int
    let duration : String
    let departureTime : String
    let arrivalTime : String
    let origin : String
    let destination : String
    let stops : Int
    let airlineCode : String
    let baggageAllowance : String
    let wifiAvailability : Bool
    let inFlightEntertainment : Bool
    let mealIncluded : Bool

    // Die Flights-Struktur repräsentiert einen Flug und speichert Informationen über den Flug.

    // Die Flights-Struktur hat folgende Eigenschaften:
    // - id: Die eindeutige ID des Fluges
    // - name: Der Name des Fluges
    // - image: Der Name oder Pfad zum Bild des Fluges
    // - description: Eine Beschreibung des Fluges
    // - price: Der Preis des Fluges
    // - duration: Die Dauer des Fluges
    // - departureTime: Die Abflugzeit des Fluges
    // - arrivalTime: Die Ankunftszeit des Fluges
    // - origin: Der Ursprung des Fluges
    // - destination: Das Ziel des Fluges
    // - stops: Die Anzahl der Zwischenstopps
    // - airlineCode: Der Code der Fluggesellschaft
    // - baggageAllowance: Das Gepäcklimit des Fluges
    // - wifiAvailability: Die Verfügbarkeit von WLAN auf dem Flug
    // - inFlightEntertainment: Die Verfügbarkeit von Unterhaltungsmöglichkeiten während des Fluges
    // - mealIncluded: Gibt an, ob Mahlzeiten im Flugpreis enthalten sind

    // Diese Struktur kann verwendet werden, um Flugobjekte in deiner Anwendung darzustellen und zu verarbeiten.
}


// MARK: - Erstellen weiterer Instanzen der Flights-Struct und Speichern in Variablen
private var flight1 = Flights(name: "Ethiopian Airlines", image: "Ethiopian Airlines",description: "International Airline We fly with us 365 Days of the Year", price: 1140, duration: "6h 30m", departureTime: "12:30 PM", arrivalTime: "6:00 PM", origin: "ADD", destination: "FRA", stops: 0, airlineCode: "ET", baggageAllowance: "2 bags, 23kg each", wifiAvailability: true, inFlightEntertainment: true, mealIncluded: true)

private var flight2 = Flights(name: "Lufthansa Airlines", image: "Lufthansa",description: "Lufthansa A German Airlines Thank You when you fly with us",price: 599, duration: "2h 15m", departureTime: "8:45 AM", arrivalTime: "11:00 AM", origin: "TXL", destination: "MUC", stops: 0, airlineCode: "LH", baggageAllowance: "1 bag, 23kg", wifiAvailability: true, inFlightEntertainment: true, mealIncluded: true)


private var flight3 = Flights(name: "Turkish Airlines", image: "Turkish Airlines",description: "Türkisch Airline a better Flight ",price: 399, duration: "4h 45m", departureTime: "10:30 PM", arrivalTime: "4:15 AM", origin: "IST", destination: "AMS", stops: 1, airlineCode: "TK", baggageAllowance: "2 bags, 32kg each", wifiAvailability: true, inFlightEntertainment: true, mealIncluded: true)

private var flight4 = Flights(name: "ATA Airlines", image: "ATA Airlines",description: "A Airline who since at 1978", price: 699, duration: "3h 15m", departureTime: "6:00 AM", arrivalTime: "9:15 AM", origin: "JFK", destination: "ORD", stops: 0, airlineCode: "ATA", baggageAllowance: "2 bags, 23kg each", wifiAvailability: true, inFlightEntertainment: false, mealIncluded: false)

private var flight5 = Flights(name: "Condor Airlines", image: "Condor Airlines",description: "A Airline who since at 1978", price: 999, duration: "9h 0m", departureTime: "1:30 PM", arrivalTime: "10:30 PM", origin: "FRA", destination: "LAS", stops: 1, airlineCode: "DE", baggageAllowance: "1 bag, 20kg", wifiAvailability: false, inFlightEntertainment: true, mealIncluded: true)

private var flight6 = Flights(name: "WANDA AIRLINES", image: "WANDA AIRLINES",description: "A Airline who since at 1978", price: 444, duration: "8h 45m", departureTime: "2:15 AM", arrivalTime: "11:30", origin: "FRA", destination: "LAS", stops: 1, airlineCode: "DE", baggageAllowance: "1 bag, 20kg", wifiAvailability: false, inFlightEntertainment: true, mealIncluded: true)

private var flight7 = Flights(name: "WANDA AIRLINES", image: "WANDA AIRLINES",description: "A Airline who since at 1978", price: 444, duration: "8h 45m", departureTime: "2:15 AM", arrivalTime: "11:30", origin: "FRA", destination: "LAS", stops: 1, airlineCode: "DE", baggageAllowance: "1 bag, 20kg", wifiAvailability: false, inFlightEntertainment: true, mealIncluded: true)

private var flight8 = Flights(name: "WANDA AIRLINES", image: "WANDA AIRLINES",description: "A Airline who since at 1978", price: 444, duration: "8h 45m", departureTime: "2:15 AM", arrivalTime: "11:30", origin: "FRA", destination: "LAS", stops: 1, airlineCode: "DE", baggageAllowance: "1 bag, 20kg", wifiAvailability: false, inFlightEntertainment: true, mealIncluded: true)



// Weitere Fluginstanzen können hier eingefügt werden

struct FlightModel {
    var flightsList : [Flights] = [flight1,flight2] // Hier die Fluginstanzen hinzufügen
    var searchtext : String = ""
}
