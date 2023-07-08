
import SwiftUI
// Hier regeln wir das Verhalten wenn die App startet entweder es kommt der Onboardingscreen wenn man die App das 1 x startet
// ansonsten kommt der
struct OnboardingRules: View {
    
    @EnvironmentObject var authService : AuthService
    @AppStorage("onBoarding")  var onBoarding = true
    @State private var showLoginView = false
    @State private var RestartOnboarding = false

    var body: some View {
        VStack {
            if onBoarding {
                OnBoardingView()
            } else {
                Group{
                    if authService.user != nil{
                        MainView()
                    }else{
                        MenüView()
                            .transition(.opacity.animation(.default))
                        
                    }
                }.onAppear{
                    authService.listenToAuthState()
                }
               
            }
        }
    }
}

struct OnboardingRules_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingRules()
    }
}


import SwiftUI

struct MenüView: View {
    
    @AppStorage("onBoarding")  var onBoarding = false
    
    
    @State private var showLoginView = false
    @State private var RestartOnboarding = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @State private var imageRotation: Double = 0
    
    
    var body: some View {
        ZStack {
            
            Image("studentonroad")
                .resizable()
                .scaledToFill()
                .overlay(Rectangle())
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.black.opacity(0.55))
                .contrast(0.7)
                .offset(x: -110)
                .opacity(01.05)

            VStack(spacing: 40) {
                
                Text("Explore ...")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.yellow)
                    .font(.system(size: 38, weight: .regular))
                    .foregroundColor(.black.opacity(1.00))
                    .padding()
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .opacity(1.05)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.65, x: 0.35, y: 0.35)
                    .padding(.bottom, 50)
                
                Text("Hello\nCan I help You?........")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .fontWeight(.thin)
                    .padding()
                
                Spacer()
                
                // 1 Button
                Button(action: {
                    self.showLoginView = true
                }, label: {
                    Text("Explore")
                        .font(.headline)
                        .foregroundColor(.white)
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                        .padding(.horizontal, 50)
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
                })
                .shadow(radius: 10)
                .sheet(isPresented: $showLoginView) {
                    LoginView()
                }
               
            }
        }
    }
}

struct MenüView_Previews: PreviewProvider {
    static var previews: some View {
        MenüView()
    }
}


import SwiftUI

struct OnboardItem: View {
    
    var image: String = ""
    var title: String = ""
    var description: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            
            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .scaledToFill()
                .blur(radius: 0.5)
               // .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                .cornerRadius(30)
            
            Spacer()
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .kerning(0.8)// Anp. des horizontalen Abst. zw. Buchstaben in einem Text
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .foregroundColor(.yellow)
            
                
                Text(description)
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding(.vertical, 5)
                    .multilineTextAlignment(.center)
                //  .padding(.leading, 20)
                
                Spacer()
            }
        }
    }
    

struct OnboardItem_Previews: PreviewProvider {
    static var previews: some View {
        OnboardItem()
    }
}


struct MemberView: View {
    
    var body: some View {
        Text("Herzlich Willkommen")
    }
}

