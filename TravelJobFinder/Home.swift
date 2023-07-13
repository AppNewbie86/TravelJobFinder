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
            ActivityTripView()
                .tag("Events")
            BookingView(flight: "Flug nach Paris", hotel: "Hotel XYZ", activity: "Stadtführung")
                .tag("Meine Reise")
            SettingView()
                .tag("Setting")
            NotificationView(notifications: Notification(name: "", image: "", description: ""))
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
    var notifications: Notification

    @EnvironmentObject var notificationViewModel: NotificationViewModel
    @Environment(\.presentationMode) var presentationMode

    var newsItems: [NewsItem] = [
        NewsItem(title: "Neue Reiseziele für den Sommer"),
        NewsItem(title: "Günstige Angebote für Last-Minute-Buchungen"),
        NewsItem(title: "Aktivitäten und Veranstaltungen für Familien")
    ]
    
    var holidayItems: [HolidayItem] = [
        HolidayItem(title: "Hier können Sie sehen wenn es zu ihrer Reise Neuigkeiten gibt."),
        HolidayItem(title: "Corona Bestimmungen einsehen"),
        HolidayItem(title: "Einreise Informationen")
    ]


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
                    if newsItems.isEmpty && holidayItems.isEmpty {
                        Text("Keine Neuigkeiten vorhanden.")
                            .italic()
                            .foregroundColor(.gray)
                    } else {
                        List(newsItems, id: \.self) { newsItem in
                            Text(newsItem.title)
                        }
                        List(holidayItems, id: \.self) { holidayItem in
                            Text(holidayItem.title)
                        }
                    }
                }
                .padding(.top)

                Spacer()
            }
            
          
        }
    }


}

struct NewsItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

struct HolidayItem : Identifiable, Hashable {
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
import SwiftUI

struct BookingView: View {
    var flight: String
    var hotel: String
    var activity: String
    
    @State private var isDropDownOpen = false
    @State private var selectedClass: TravelClass = .firstClass
    @State private var isTicketDetailsOpen = false
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.isDropDownOpen.toggle()
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .padding()
                
                Text("Buchungsdetails")
                    .font(.title)
                    .padding()
                
                Text("Flug: \(flight)")
                    .padding()
                
                Text("Hotel: \(hotel)")
                    .padding()
                
                Text("Aktivität: \(activity)")
                    .padding()
                
                Spacer()
                
                Text("Klasse auswählen:")
                    .font(.headline)
                    .padding()
                
                HStack(spacing: 16) {
                    TicketShape(shape: .firstClass, isSelected: selectedClass == .firstClass)
                        .onTapGesture {
                            selectedClass = .firstClass
                        }
                    
                    TicketShape(shape: .secondClass, isSelected: selectedClass == .secondClass)
                        .onTapGesture {
                            selectedClass = .secondClass
                        }
                    
                    TicketShape(shape: .businessClass, isSelected: selectedClass == .businessClass)
                        .onTapGesture {
                            selectedClass = .businessClass
                        }
                    
                    TicketShape(shape: .studentClass, isSelected: selectedClass == .studentClass)
                        .onTapGesture {
                            selectedClass = .studentClass
                        }
                }
                .padding(.horizontal)
                
                Button(action: {
                    self.isTicketDetailsOpen.toggle()
                }) {
                    Text("Ticket ausfüllen")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isTicketDetailsOpen) {
                    // Ticket-Details anzeigen und bearbeiten
                    // Hier kannst du eine separate View erstellen, die die Ticket-Details darstellt und sie hier anzeigen
                    TicketDetailsView(selectedClass: selectedClass)
                }
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Buchung")
        }
    }
}

struct TicketShape: View {
    var shape: TicketShapeType
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: shape.imageName)
                .font(.system(size: 50))
                .foregroundColor(isSelected ? .white : .gray)
                .padding(20)
                .background(isSelected ? shape.color : Color.white)
                .cornerRadius(10)
            
            Text(shape.description)
                .font(.subheadline)
                .foregroundColor(isSelected ? .black : .gray)
        }
    }
}

struct TicketDetailsView: View {
    var selectedClass: TravelClass
    
    var body: some View {
        VStack {
            Text("Ticketdetails")
                .font(.title)
                .padding()
            
            Form {
                Section(header: Text("Klasse")) {
                    Text(selectedClass.description)
                }
                
                Section(header: Text("Name")) {
                    TextField("Vorname", text: .constant(""))
                    TextField("Nachname", text: .constant(""))
                }
                
                Section(header: Text("Reisepass")) {
                    TextField("Reisepassnummer", text: .constant(""))
                    TextField("Ausstellungsland", text: .constant(""))
                }
                
                // Weitere Informationen zur Ticketdetails hier hinzufügen
                
                Button(action: {
                    // Ticketdetails speichern oder absenden
                }) {
                    Text("Speichern")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

enum TicketShapeType {
    case firstClass
    case secondClass
    case businessClass
    case studentClass
    
    var imageName: String {
        switch self {
        case .firstClass:
            return "star"
        case .secondClass:
            return "star.fill"
        case .businessClass:
            return "circle"
        case .studentClass:
            return "triangle"
        }
    }
    
    var color: Color {
        switch self {
        case .firstClass:
            return Color.red
        case .secondClass:
            return Color.blue
        case .businessClass:
            return Color.green
        case .studentClass:
            return Color.yellow
        }
    }
    
    var description: String {
        switch self {
        case .firstClass:
            return "1. Klasse"
        case .secondClass:
            return "2. Klasse"
        case .businessClass:
            return "Business-Klasse"
        case .studentClass:
            return "Studentenklasse"
        }
    }
}

enum TravelClass {
    case firstClass
    case secondClass
    case businessClass
    case studentClass
    
    var description: String {
        switch self {
        case .firstClass:
            return "1. Klasse"
        case .secondClass:
            return "2. Klasse"
        case .businessClass:
            return "Business-Klasse"
        case .studentClass:
            return "Studentenklasse"
        }
    }
}

import SwiftUI

struct FlightSelectionView: View {
    // MARK: Aufstellen von Variablen
    var size: CGSize
    var safeArea: EdgeInsets
    // MARK: Gesture Properties
    @State var offsetY : CGFloat = 0
    @State var currentCardIndex : CGFloat = 0
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
                .zIndex(1)
            PaymentCardView()
                .zIndex(0)

            // Add more views and content here
        }
    }
    
    @ViewBuilder
    // MARK: HeaderView
    func HeaderView() -> some View {
        VStack {
            Image("Logo 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width * 0.4)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                // Add content to the HStack here
                DetailSelectionFlightView(place: "London", code: "LON", timing: "23. Nov, 23.00 Uhr")
                
                VStack(spacing: 8) {
                    Image(systemName: "chevron.right")
                    
                    Text("4h 13 min")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                DetailSelectionFlightView(alignment: .trailing, place: "Las Vegas", code: "LAV", timing: "23. Nov, 13.15 Uhr")
            }
            .padding(.top, 20)
            
            // MARK: AIRPLANE IMAGE VIEW
            
            Image("plane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 160)
                .padding(.bottom,-20)
        }
        .padding(15)
        .padding(.top, safeArea.top)
        .background {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color("LightYellow"),
                            Color("Airred"),
                            Color("Airred")
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
    }
    @ViewBuilder
    // MARK: PaymentCardView
    func PaymentCardView() -> some View {
     
        VStack {
            Text("Wähle deine Bezahlmethode")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.vertical)
            
            GeometryReader {_ in
                VStack(spacing: 0) {
                    ForEach(sampleCards.indices,id: \.self) { index in
                        CardView(index: index)
                    }
                    .padding(.horizontal, 30)
                    .offset(y: offsetY)
                    .offset(y: currentCardIndex * -200.00)

                }
                .coordinateSpace(name: "SCROLL")
            } // GeometryReader
            .contentShape(Rectangle())
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        // Degreasing Speed
                        offsetY = value.translation.height * 0.3
                    }).onEnded({value in
                        let translation = value.translation.height
                        withAnimation(.easeInOut) {
                            // MARK: Increasing/Decreasing Index based on Condition
                            // 100 -> Since Card Height = 200
                            
                            // If the user dragged the view downwards (positive translation) and the translation is greater than 100, and the currentCardIndex is greater than 0, decrease the currentCardIndex by 1.
                            if translation > 0 && translation > 100 && currentCardIndex > 0 {
                                currentCardIndex -= 1
                            }
                            
                            // If the user dragged the view upwards (negative translation) and the absolute value of the translation is greater than 100, and the currentCardIndex is less than the number of sampleCards minus 1, increase the currentCardIndex by 1.
                            if translation < 0  && -translation > 100 && currentCardIndex < CGFloat(sampleCards.count - 1) {
                                currentCardIndex += 1
                            }
                            
                            offsetY = .zero
                        }
                    })
            )
        } // End VStack
    }

    @ViewBuilder
    // MARK: PaymentCardView
    func CardView(index : Int) -> some View {
        GeometryReader{ proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / size.height
            let constrainedprogress = progress > 1 ? 1 : progress < 0 ? 0 : progress
            
            Image(sampleCards[index].cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width,height: size.height)
            // MARK: SHADOW
                .shadow(color: .black.opacity(0.14), radius: 8, x: 6, y: 6)
            // MARK: Stacked Card Animation
                .rotation3DEffect(.init(degrees: constrainedprogress * 40.0), axis: (x:1,y: 0,z:0), anchor: .bottom)
                .padding(.top,progress * -160.0)
                .offset(y: progress < 0 ? progress * 250 : 0)
        }
        .frame(height: 200)
        .zIndex(Double(sampleCards.count - index))
    }
    @ViewBuilder
    func DetailSelectionFlightView(alignment: HorizontalAlignment = .leading, place: String, code: String, timing: String) -> some View {
        
        // Implement the DetailSelectionFlightView function here
        VStack(alignment: alignment, spacing: 6) {
            Text(place)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
            
            Text(code)
                .font(.title)
                .foregroundColor(.white)
            
            Text(timing)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    struct FlightSelectionView_Previews: PreviewProvider {
        static var previews: some View {
            FlightSelectionView(
                size: CGSize(width: 375, height: 667), // Provide desired size
                safeArea: EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0) // Provide desired safe area
            )
        }
    }
}
