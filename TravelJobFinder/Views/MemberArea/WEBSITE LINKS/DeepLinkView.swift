
import SwiftUI


struct DeepLinkView: View {
    let deepLink: String
    
    var body: some View {
        VStack {
            Text("Deep Link View")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            
            Text("Deep Link: \(deepLink)")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
        }
    }
}

struct DeepLinkView_Previews: PreviewProvider {
    static var previews: some View {
        DeepLinkView(deepLink: "example.com/deeplink")
    }
}
