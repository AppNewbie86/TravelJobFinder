
import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    var animation: Namespace.ID
    @Binding var selectedTab: String
    var body: some View {
       Button(action: {
           withAnimation(.spring()){
               selectedTab = title
           }
       }, label: {
           HStack(spacing:15){
               Image(systemName: image)
                   .resizable()
                   .frame(width: 22, height: 22)
                   
               Text(title)
                   .font(.system(size: 16))
                   .fontWeight(.bold)
           }
           .foregroundColor(selectedTab == title ? Color("Purple") : .black)
          
           .padding()
           .background(
            ZStack{
                if selectedTab == title{
                    Color.black
                        .opacity(selectedTab == title ? 1 : 0)
                   .clipShape(CustomCorner(corner: [.topRight, .bottomRight], radius: 5))
                   .matchedGeometryEffect(id: "TAB", in: animation)
                }
            }
           
           )
       })
      
     
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
