
import SwiftUI

struct HelpLinkView: View {
    let linkTitle: String
    let linkImage: String
    let deepLink: String
    
    var body: some View {
        NavigationLink(destination: DeepLinkView(deepLink: deepLink)) {
            HStack {
                Image(linkImage)
                    .resizable()
                    .frame(width: 32, height: 32)
                
                Text(linkTitle)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
    }
}


struct HelpLinkView_Previews: PreviewProvider {
    static var previews: some View {
        HelpLinkView(linkTitle: "Help", linkImage: "help.icon", deepLink: "help")
    }
}
