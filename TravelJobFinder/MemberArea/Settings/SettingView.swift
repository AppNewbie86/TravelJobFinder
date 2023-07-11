import SwiftUI
import Combine
import FirebaseAuth
import Firebase

struct SettingView: View {
    @EnvironmentObject var authService: AuthService
       @State var show = false
       @State private var showLoginView = false
       @Environment(\.presentationMode) var presentationMode // Füge die Präsentationsmodus-Umgebung hinzu
       
    var body: some View {
      
            List {
                Section(header: Text("Allgemein").font(.headline)) {
                    NavigationLink(destination: CreateProfileView()) {
                        Label("Profil erstellen", systemImage: "person") // NavigationLink für das Erstellen eines Profils
                    }
                    
                    NavigationLink(destination: ChangePasswordView()) {
                        Label("Passwort vergessen", systemImage: "lock") // NavigationLink für das Ändern des Passworts
                    }
                }
                
                Section(header: Text("Benachrichtigungen").font(.headline)) {
                    Toggle(isOn: .constant(true)) {
                        Label("Push-Benachrichtigungen", systemImage: "bell") // Toggle für Push-Benachrichtigungen
                    }
                    Toggle(isOn: .constant(false)) {
                        Label("E-Mail-Benachrichtigungen", systemImage: "envelope") // Toggle für E-Mail-Benachrichtigungen
                    }
                }
                
                Section(header: Text("Datenschutz").font(.headline)) {
                    NavigationLink(destination: TermsOfServiceView()) {
                        Label("Nutzungsbedingungen", systemImage: "doc.text") // NavigationLink für die Nutzungsbedingungen
                    }
                    NavigationLink(destination: PrivacyPolicyView()) {
                        Label("Datenschutz", systemImage: "shield") // NavigationLink für die Datenschutzrichtlinie
                    }
                }
                }
                .navigationBarBackButtonHidden(true) // Verstecke den originalen Back-Button
                .navigationBarItems(leading: backButton) // Füge einen benutzerdefinierten Back-Button hinzu
                .navigationTitle("Einstellungen")
        
           
        }
    private var backButton: some View {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.blue)
                    .font(.title)
            }
            .padding(.all, 16)
            .hidden()
        }
  
    }


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(AuthService()) // Beispielhaftes AuthService-Environment-Objekt für die Vorschau
    }
}
