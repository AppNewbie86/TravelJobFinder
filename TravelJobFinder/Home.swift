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
