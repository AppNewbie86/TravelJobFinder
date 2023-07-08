
import SwiftUI


struct CreateProfileView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profilinformationen").font(.headline)) {
                    TextField("Benutzername", text: $username)
                    TextField("E-Mail", text: $email)
                    SecureField("Passwort", text: $password)
                }

                Section {
                    Button(action: {
                        // Perform profile creation logic here
                    }) {
                        Text("Profil erstellen")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(
                                        Color(
                                            red: 75 / 255,
                                            green: 115 / 255,
                                            blue: 115 / 255
                                        )
                                    )
                            )
                    }
                    .disabled(!isFormValid)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Profil erstellen")
        }
    }

    private var isFormValid: Bool {
        !username.isEmpty && !email.isEmpty && !password.isEmpty
    }
}


struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
