
import SwiftUI
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
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(notifications: Notification(name: "", image: "", description: ""))
    }
}
