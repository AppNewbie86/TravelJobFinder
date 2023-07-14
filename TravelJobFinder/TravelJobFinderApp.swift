// In diesem Code werden Firebase und SwiftUI verwendet, um eine App zu konfigurieren und zu starten.

// Importe: Zunächst werden die erforderlichen Frameworks importiert: SwiftUI und FirebaseCore.

// AppDelegate-Klasse: Diese Klasse implementiert das UIApplicationDelegate-Protokoll und dient als Delegat des App-Delegaten. Die Methode application(_:didFinishLaunchingWithOptions:) wird aufgerufen, wenn die App gestartet wird. In diesem Fall wird die FirebaseApp.configure()-Methode aufgerufen, um Firebase zu konfigurieren. Diese Methode muss aufgerufen werden, bevor andere Firebase-Funktionen verwendet werden können.

// @main-Attribut: Dieses Attribut markiert die TravelJobFinderApp-Struktur als den Hauptpunkt der App. Es wird verwendet, um die App zu initialisieren und die Hauptansicht (MainView) zu erstellen.

// @EnvironmentObject: Die AuthService- und TripTypeViewModel-Objekte werden als Environment Objects deklariert und in die App-Umgebung (EnvironmentObject) eingefügt. Dadurch können sie von verschiedenen Ansichten innerhalb der App verwendet werden, ohne sie explizit durch die Ansichten zu übergeben.

// UIApplicationDelegateAdaptor: Dieser Modifier weist SwiftUI an, den AppDelegate als Delegaten des App-Delegaten zu verwenden. Dadurch kann der AppDelegate-Code ausgeführt werden, wenn die App gestartet wird.

// body: Dies ist der Hauptkörper der App. Die MainView wird als Hauptansicht festgelegt und mit den Environment Objects (AuthService und tripTide) versehen.

// Insgesamt wird in diesem Code Firebase konfiguriert und die Hauptansicht der App mit den erforderlichen Environment Objects erstellt.

// Hinweis: Um Firebase erfolgreich zu verwenden, muss die Firebase-Konfiguration in der App korrekt eingerichtet sein, einschließlich der Bereitstellung der GoogleService-Info.plist-Datei und der Aktivierung der entsprechenden Firebase-Dienste in der Firebase Console.
import SwiftUI
import FirebaseCore
import Combine


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct TravelJobFinderApp: App {
    @EnvironmentObject var authService : AuthService
    @StateObject private var tripTide = TripTypeViewModel()
    @StateObject private var hotelTide = HotelViewModel()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(AuthService())
                .environmentObject(tripTide)
                .environmentObject(hotelTide)

        }
    }
}
