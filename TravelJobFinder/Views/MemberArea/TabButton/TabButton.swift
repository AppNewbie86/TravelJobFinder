import SwiftUI

struct TabButton: View {
    var image: String // Name des Symbols für das Tab-Icon
    var title: String // Titel des Tabs
    var animation: Namespace.ID // ID für die Animation
    @Binding var selectedTab: String // Binding zur verfolgten Auswahl des Tabs
    
    var body: some View {
       Button(action: {
           withAnimation(.spring()){
               selectedTab = title // Auswahl des Tabs aktualisieren
           }
       }, label: {
           HStack(spacing:15){
               Image(systemName: image)
                   .resizable()
                   .frame(width: 22, height: 22) // Symbolgröße festlegen
                   
               Text(title)
                   .font(.system(size: 16))
                   .fontWeight(.bold) // Textstil für den Titel des Tabs
           }
           .foregroundColor(selectedTab == title ? Color("Purple") : .black) // Textfarbe basierend auf dem ausgewählten Tab anpassen
          
           .padding()
           .background(
            ZStack{
                if selectedTab == title{
                    Color.black
                        .opacity(selectedTab == title ? 1 : 0) // Hintergrundfarbe des ausgewählten Tabs anpassen
                   .clipShape(CustomCorner(corner: [.topRight, .bottomRight], radius: 5)) // Ecken des Hintergrunds abrunden
                   .matchedGeometryEffect(id: "TAB", in: animation) // Animationseffekt für den ausgewählten Tab
                }
            }
           
           )
       })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        MainView() // Vorschau der TabButton-Komponente in der MainView
    }
}
