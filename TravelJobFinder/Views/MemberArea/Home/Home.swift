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




