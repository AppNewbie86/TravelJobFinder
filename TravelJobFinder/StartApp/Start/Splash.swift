import SwiftUI

struct Splash: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color("LightYellow")
                    .edgesIgnoringSafeArea(.all)
                
                Image("Splash")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea(.all)
                    .animation(.easeInOut(duration: 1.9))
                    .transition(.scale)
                
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .foregroundColor(.blue)
                        .scaleEffect(isActive ? 1.2 : 0.6)
                        .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                withAnimation {
                                    self.isActive = true
                                }
                            }
                        }
                    
                    Text("Escape Secrets")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                        .padding(.all)
                    
                    Spacer()
                }
            }
        }
    }
}

struct Previews_SplashView_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
