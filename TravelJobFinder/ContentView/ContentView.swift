import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService : AuthService
  


    var body: some View {
        NavigationStack {
            
            
            ZStack {
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.black,.black,.black], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    OnboardingRules()
                }
            }
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
