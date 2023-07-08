
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService: AuthService // Eingefügtes AuthService Environment-Objekt
    
    // Variablen zum Speichern der E-Mail und des Passworts
    @State var email: String = "" // E-Mail-Eingabestatus
    @State var password: String = "" // Passwort-Eingabestatus
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Image("studentonroad")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .overlay(Rectangle())
                .foregroundColor(.black.opacity(0.65))
                .contrast(0.8)
                .offset(x: -30)
                .opacity(0.95)
            
            VStack {
                Text("Urlaub....")
                    .font(.system(size: 44, weight: .semibold))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                    .padding(.top, 50)
                Text("machts schöner")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                Spacer()
                
                Text("Login")
                    .font(.system(size: 44, weight: .semibold))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                Spacer()
                
                Section(header:
                    HStack {
                        Spacer()
                        Text("Email")
                        Spacer()
                    }
                ) {
                    TextField("Email", text: $email)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .frame(width: 370, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color.black.opacity(0.23))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        )
                        .padding(.horizontal, 20)
                }

                Section(header:
                    HStack {
                        Spacer()
                        Text("Passwort")
                        Spacer()
                    }
                ) {
                    SecureField("Password", text: $password)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .frame(width: 370, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color.black.opacity(0.23))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        )
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                }

                
                Button(action: {
                    authService.signUp(email: email, password: password)
                }, label: {
                    Text("Registrieren")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 70)
                       .padding(.vertical, 16)
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
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                })
                .disabled(email.isEmpty || password.isEmpty)
                
                Button(action: {
                    authService.signIn(email: email, password: password)
                }, label: {
                    Text("Anmelden")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 77)
                        .padding(.vertical, 16)
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
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                })
                
                Spacer(minLength: 100)
            }
        }
        .background(Color.black)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

