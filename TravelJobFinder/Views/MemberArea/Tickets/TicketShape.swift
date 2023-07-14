
import SwiftUI


struct TicketShape: View {
    var shape: TicketShapeType
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: shape.imageName)
                .font(.system(size: 50))
                .foregroundColor(isSelected ? .white : .gray)
                .padding(20)
                .background(isSelected ? shape.color : Color.white)
                .cornerRadius(10)
            
            Text(shape.description)
                .font(.subheadline)
                .foregroundColor(isSelected ? .black : .gray)
        }
    }
}


struct TicketShape_Previews: PreviewProvider {
    static var previews: some View {
        TicketShape(shape: .firstClass, isSelected: true)
    }
}
