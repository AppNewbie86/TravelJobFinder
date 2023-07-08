
import SwiftUI

struct ChangePasswordView: View {
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var showErrorAlert = false

    var body: some View {
        Form {
            Section(header: Text("Aktuelles Passwort").font(.headline)) {
                SecureField("Aktuelles Passwort", text: $currentPassword)
            }

            Section(header: Text("Neues Passwort").font(.headline)) {
                SecureField("Neues Passwort", text: $newPassword)
                SecureField("Passwort bestätigen", text: $confirmPassword)
            }

            Section {
                Button(action: {
                    if newPassword == confirmPassword {
                        // Perform password change logic here
                        currentPassword = ""
                        newPassword = ""
                        confirmPassword = ""
                    } else {
                        showErrorAlert = true
                    }
                }) {
                    Text("Passwort ändern")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("Fehler"),
                message: Text("Die eingegebenen Passwörter stimmen nicht überein."),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("Passwort ändern")
    }
}


struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
