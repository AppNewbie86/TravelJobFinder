
import SwiftUI

struct Help: View {
    var body: some View {
        NavigationView {
            VStack {

                Image("helpImage")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                VStack(spacing: 16) {
                    HelpLinkView(linkTitle: "SUPPORT", linkImage: "link1Image", deepLink: "link1DeepLink")
                    HelpLinkView(linkTitle: "KUNDENTELEFON", linkImage: "link2Image", deepLink: "link2DeepLink")
                    HelpLinkView(linkTitle: "EMAIL", linkImage: "link3Image", deepLink: "link3DeepLink")
                    HelpLinkView(linkTitle: "MESSENGER", linkImage: "link4Image", deepLink: "link4DeepLink")
                    HelpLinkView(linkTitle: "WIKI", linkImage: "link5Image", deepLink: "link5DeepLink")
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(16)
                .shadow(radius: 4)
                .padding()
            }
            .navigationBarTitle("Help")
            .navigationBarItems(trailing: Button(action: {
                // Implement close button action here
            }) {
                Image(systemName: "plus")
            })
        }
    }
}


struct Help_Previews: PreviewProvider {
    static var previews: some View {
        Help()
    }
}
