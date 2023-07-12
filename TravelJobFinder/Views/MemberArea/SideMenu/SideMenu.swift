import SwiftUI

struct SideMenu: View {
    @Binding var selectedTab : String
    @Namespace var animation
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15, content: {
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .padding(.top,50) // Oberer Abstand für das Profilbild
                
                VStack(alignment: .leading,spacing: 6, content: {
                    Text("Name")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black) // Stil für den Namen
                    NavigationLink(destination: CreateProfileView()) {
                        Text("View Profile")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .opacity(0.7) // Button zum Anzeigen des Profils
                    }
                })
                
                VStack(alignment: .leading, spacing: 0) {
                    TabButton(image: "house", title: "Home", animation: animation, selectedTab: $selectedTab) // TabButton für Home
                    TabButton(image: "airplane.departure", title: "Flüge", animation: animation, selectedTab: $selectedTab) // TabButton für Flüge
                    TabButton(image: "bed.double.circle.fill", title: "Hotels", animation: animation, selectedTab: $selectedTab) // TabButton für Hotels
                    TabButton(image: "mountain.2", title: "Events", animation: animation, selectedTab: $selectedTab) // TabButton für Events
                    TabButton(image: "globe.europe.africa.fill", title: "Meine Reise", animation: animation, selectedTab: $selectedTab) // TabButton für Meine Reise
                    TabButton(image: "gear", title: "Setting", animation: animation, selectedTab: $selectedTab) // TabButton für Einstellungen
                    TabButton(image: "bell", title: "Notification", animation: animation, selectedTab: $selectedTab) // TabButton für Benachrichtigungen
                    TabButton(image: "figure.wave.circle.fill", title: "Jobsearching", animation: animation, selectedTab: $selectedTab) // TabButton für Jobsuche
                }
                .padding(.leading,-15) // Linken Innenabstand für die TabButtons
                .padding(.top,50) // Oberer Abstand für die TabButtons
            })
            .padding() // Innenabstand für den gesamten SideMenu-Inhalt
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading) // Maximale Breite und Höhe für das SideMenu
        }
    }
}
struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainView() // Vorschau des SideMenus in der MainView
    }
}
