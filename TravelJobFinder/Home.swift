import SwiftUI
import FirebaseCoreInternal
struct Home: View {
    @Binding var selectedTab: String
    @State private var showJobRow = false

    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            NewsPage()
                .tag("Home")
            FlightListView(flightListViewIsShowing: Binding(
                get: { selectedTab == "Flüge" },
                set: { if $0 { selectedTab = "Flüge" } }
            ))
            .tag("Flüge")
            HotelListView()
                .tag("Hotels")
            SettingView()
                .tag("Setting")
            NotificationView()
                .tag("Notification")
            Help()
                .tag("Help")
            JobRow(viewModel: JobListViewModel())
                .tag("Jobsearching")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct NotificationView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                // Instructions Section
                Section(header: Text("Was kann man hier machen?").font(.headline)) {
                    Text("Willkommen in der Benachrichtigungsansicht! Hier kannst du wichtige Informationen und Neuigkeiten anzeigen lassen.")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding(.top)

                // News Section
                Section(header: Text("Neuigkeiten").font(.headline)) {
                    if newsItems.isEmpty {
                        Text("Keine Neuigkeiten vorhanden.")
                            .italic()
                            .foregroundColor(.gray)
                    } else {
                        List(newsItems, id: \.self) { newsItem in
                            Text(newsItem.title)
                        }
                    }
                }
                .padding(.top)

                Spacer()

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(
                                    Color(
                                        red: 75 / 255,
                                        green: 115 / 255,
                                        blue: 115 / 255
                                    )
                                )
                        )
                        .cornerRadius(8)
                        .cornerRadius(10)
                }
                .padding()

            }
            .navigationTitle("Notification")
            .navigationBarItems(trailing: closeButton)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Display as modal sheet
    }

    private var closeButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark")
                .font(.title)
                .foregroundColor(.black)
        }
    }

    // Dummy news items for demonstration
    private let newsItems = [
        NewsItem(title: "Neuigkeit 1"),
        NewsItem(title: "Neuigkeit 2"),
        NewsItem(title: "Neuigkeit 3")
    ]
}

struct NewsItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
}


struct HelpLinkView: View {
    let linkTitle: String
    let linkImage: String
    let deepLink: String
    
    var body: some View {
        NavigationLink(destination: DeepLinkView(deepLink: deepLink)) {
            HStack {
                Image(linkImage)
                    .resizable()
                    .frame(width: 32, height: 32)
                
                Text(linkTitle)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
    }
}

struct DeepLinkView: View {
    let deepLink: String
    
    var body: some View {
        VStack {
            Text("Deep Link View")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            
            Text("Deep Link: \(deepLink)")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
        }
    }
}

import Foundation
import SwiftUI


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
   
}

// Erstellen weiterer Instanzen der Flights-Struct und Speichern in Variablen
private var flight1 = Flights(name: "Ethiopian Airlines", image: "Ethiopian Airlines",description: "International Airline We fly with us 365 Days of the Year", price: 1140, duration: "6h 30m", departureTime: "12:30 PM", arrivalTime: "6:00 PM", origin: "ADD", destination: "FRA", stops: 0, airlineCode: "ET", baggageAllowance: "2 bags, 23kg each", wifiAvailability: true, inFlightEntertainment: true, mealIncluded: true)

private var flight2 = Flights(name: "Lufthansa Airlines", image: "Lufthansa",description: "Lufthansa A German Airlines Thank You when you fly with us",price: 599, duration: "2h 15m", departureTime: "8:45 AM", arrivalTime: "11:00 AM", origin: "TXL", destination: "MUC", stops: 0, airlineCode: "LH", baggageAllowance: "1 bag, 23kg", wifiAvailability: true, inFlightEntertainment: true, mealIncluded: true)

private var flight3 = Flights(name: "Turkish Airlines", image: "Turkish Airlines",description: "Türkisch Airline a better Flight ",price: 399, duration: "4h 45m", departureTime: "10:30 PM", arrivalTime: "4:15 AM", origin: "IST", destination: "AMS", stops: 1, airlineCode: "TK", baggageAllowance: "2 bags, 32kg each", wifiAvailability: true, inFlightEntertainment: true, mealIncluded: true)

private var flight4 = Flights(name: "ATA Airlines", image: "ATA Airlines",description: "A Airline who since at 1978", price: 699, duration: "3h 15m", departureTime: "6:00 AM", arrivalTime: "9:15 AM", origin: "JFK", destination: "ORD", stops: 0, airlineCode: "ATA", baggageAllowance: "2 bags, 23kg each", wifiAvailability: true, inFlightEntertainment: false, mealIncluded: false)

private var flight5 = Flights(name: "Condor Airlines", image: "Condor Airlines",description: "A Airline who since at 1978", price: 999, duration: "9h 0m", departureTime: "1:30 PM", arrivalTime: "10:30 PM", origin: "FRA", destination: "LAS", stops: 1, airlineCode: "DE", baggageAllowance: "1 bag, 20kg", wifiAvailability: false, inFlightEntertainment: true, mealIncluded: true)

private var flight6 = Flights(name: "WANDA AIRLINES", image: "WANDA AIRLINES",description: "A Airline who since at 1978", price: 444, duration: "8h 45m", departureTime: "2:15 AM", arrivalTime: "11:30", origin: "FRA", destination: "LAS", stops: 1, airlineCode: "DE", baggageAllowance: "1 bag, 20kg", wifiAvailability: false, inFlightEntertainment: true, mealIncluded: true)

private var flight7 = Flights(name: "WANDA AIRLINES", image: "WANDA AIRLINES",description: "A Airline who since at 1978", price: 444, duration: "8h 45m", departureTime: "2:15 AM", arrivalTime: "11:30", origin: "FRA", destination: "LAS", stops: 1, airlineCode: "DE", baggageAllowance: "1 bag, 20kg", wifiAvailability: false, inFlightEntertainment: true, mealIncluded: true)

private var flight8 = Flights(name: "WANDA AIRLINES", image: "WANDA AIRLINES",description: "A Airline who since at 1978", price: 444, duration: "8h 45m", departureTime: "2:15 AM", arrivalTime: "11:30", origin: "FRA", destination: "LAS", stops: 1, airlineCode: "DE", baggageAllowance: "1 bag, 20kg", wifiAvailability: false, inFlightEntertainment: true, mealIncluded: true)




struct FlightModel {
    var flightsList : [Flights] = [flight1,flight2,flight3,flight4,flight5,flight6,flight7,flight8]
    var searchtext : String = ""
    
}

import SwiftUI

struct FlightListView: View {
    @StateObject var flightType = FlightTypeViewModel()
    @Binding var flightListViewIsShowing: Bool
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.black.opacity(0.97), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                Image("flightsearchbg")
                    .resizable()
                    .ignoresSafeArea(.all)
                    .opacity(0.33)
                
                VStack {
                    SearchBarHomeRow(text: $text)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 40)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 10) {
                            ForEach(flightType.flightList.filter({ text.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(text) })) { flight in
                                NavigationLink(
                                    destination: FlightDetailView(flight: flight)
                                        .environmentObject(Cart1()),
                                    label: {
                                        FlightButton(name: flight.name, image: flight.image)
                                            .frame(height: 80)
                                            .foregroundColor(.white)
                                            .cornerRadius(6)
                                            .padding(.horizontal, 16)
                                    }
                                )
                            }
                        }
                        .padding(.horizontal, 20)
                        .background(Color.gray)
                        .cornerRadius(30)
                        .padding(.top, 20)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct FlightListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightListView(flightListViewIsShowing: .constant(true))
    }
}

import SwiftUI

struct FlightDetailView: View {
    
    var flight: Flights
    
    @EnvironmentObject var flightType : FlightTypeViewModel
    @State var rotationAngle = 0.0

    init(flight: Flights){
        self.flight = flight
    }
    
    @State var remainingTime = 3600 // an example initial value
    
    let countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.black.opacity(0.97), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .center, spacing: 10){
                    
                    HStack(alignment: .top){
                        Image(flight.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3))
                            .shadow(radius: 7)
                            .rotationEffect(.degrees(rotationAngle))
                            .animation(Animation.linear(duration: 2).repeatForever())

                    }
                    
                    Text(flight.name)
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .accessibility(label: Text("Flight Name"))
                    
                    Text(flight.description)
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                        .accessibility(label: Text("Flight Description"))
                    
                    Text("Duration: \(flight.duration)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .accessibility(label: Text("Flight Duration"))
                    
                    Text("Departure Time: \(flight.departureTime)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .accessibility(label: Text("Flight Departure Time"))
                    
                    Text("Arrival Time: \(flight.arrivalTime)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .accessibility(label: Text("Flight Arrival Time"))
                    
                    Text("Origin: \(flight.origin)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .accessibility(label: Text("Flight Origin"))
                    
                    Text("$\(flight.price)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                        .accessibility(label: Text("Flight Price"))
                    
                    Button(action: {
                        withAnimation {
                            flightType.addFlights(newItem: flight)
                            print("Added to the flight booking list")
                        }
                    }) {
                        Text("Book Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 16)
                            .background(
                                Capsule()
                                    .foregroundColor(Color(red: 75 / 255, green: 115 / 255, blue: 115 / 255)))

                    }
                    .shadow(radius: 10)
                    .padding(.top, 40)
                    .padding(.bottom, 60)
                    
                    // Countdown Widget
                    CountdownCircle(remainingTime: Double(remainingTime))
                        .frame(width: 120, height: 120)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.7))
                    .shadow(radius: 7)
            )
        }
        .onReceive(countdownTimer) { currentDate in
            let endTime = Date(timeIntervalSinceReferenceDate: TimeInterval(remainingTime))
            _ = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: endTime)
            remainingTime -= 1
            
            if remainingTime < 0 {
                countdownTimer.upstream.connect().cancel()
            }
        }
    }
}

struct CountdownCircle: View {
    let remainingTime: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.white)
            
            Text("\(formattedTime)")
                .font(.headline)
                .foregroundColor(.white)
        }
    }
    var formattedTime: String {
        let hours = Int(remainingTime) / 3600
        let minutes = Int(remainingTime) / 60 % 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

}


import SwiftUI

struct FlightButton: View {
    
    var name : String
    var image : String
    
    var body: some View {
        
        // Ein ZStack, um das Bild und den Text-Overlay zu stapeln
        ZStack(alignment: .bottom){
        
            // Ein skalierbares Bild, das das Symbol darstellt
            Image(image)
                .resizable(resizingMode: .stretch)
                .frame(width: 400, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .blur(radius: 0.5)
                .shadow(color: .gray, radius: 20, x: 2, y: 10)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(.yellow), lineWidth: ConstantsForFlightButton.General.lineWidth))

            Text(name)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.purple)
    
                      

                
        }
    }
}

struct FlightButton_Previews: PreviewProvider {
    static var previews: some View {
        FlightButton(name: "Lufthansa", image: "Lufthansa")
    }
}



import SwiftUI

struct FlightItemRow: View {
    // Zustand von TripType wird benötigt, um Elemente aus dem Warenkorb zu entfernen
    @EnvironmentObject var flightType : FlightTypeViewModel
    
    var flight : Flights
    
    var body: some View {
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.black.opacity(0.57), .black.opacity(0.47)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack(spacing:20) {
                    // Bild des Elements
                    Image(flight.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 10){
                        // Name des Elements
                        Text(flight.name)
                            .bold()
                            .foregroundColor(.white)
                        
                        // Preis des Elements
                        Text("\(flight.price)$")
                            .foregroundColor(.white)
                        
                    }
                    Spacer()
                    // Entfernen-Symbol, um Element aus dem Warenkorb zu entfernen
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                        .overlay(
                            Image(systemName: "trash")
                                .foregroundColor(.white)
                        )
                        .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                        .onTapGesture {
                            flightType.removeFromCart(newItem: flight)
                        }
                        .padding()
                    
                    
                }
                .padding(.horizontal)
                .frame(maxWidth:.infinity,alignment: .leading)
            }
        }
    }
    
}



import Foundation

import SwiftUI

//MARK: MODEL VIEW

class FlightTypeViewModel : ObservableObject{
    @Published var flightList : [Flights] = FlightModel().flightsList
    @Published var flights : [Flights] = []

    @Published var total : Int = 0
    @Published var searchText : String = ""
    
    
    func addFlights(newItem: Flights) {
       
        flights.append(newItem)
        total += newItem.price
    }
    
    func removeFromCart (newItem: Flights){
        
        flights = flights.filter{ $0.id != newItem.id}
        total -= newItem.price
    }
    
    
    
}


import SwiftUI

struct SearchBarHomeRow: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Where are you going?", text: $text)
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.leading, 10)
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.secondary)
                }
            }
        }
        .padding(.horizontal)
    }
}

import SwiftUI

class Cart1: ObservableObject {
    @Published var items: [Flights] = []
    @Published var total: Int = 0

    func addFlightItem(_ item: Flights) {
        items.append(item)
        total += item.price
    }

    func removeItem(_ item: Flights) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
            total -= item.price
        }
    }
}
