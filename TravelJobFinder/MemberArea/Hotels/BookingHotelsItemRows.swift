import SwiftUI


struct BookingHotelsItemRows: View {
    // Zustand von TripType wird benötigt, um Elemente aus dem Warenkorb zu entfernen
    @EnvironmentObject var hotelType: HotelViewModel
    
    var hotel: Hotel
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                // Bild des Elements
                Image(hotel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 10) {
                    // Name des Elements
                    Text(hotel.name)
                        .bold()
                        .foregroundColor(.white)
                    
                    // Preis des Elements
                    Text("\(hotel.price)$")
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // Entfernen-Symbol, um Element aus dem Warenkorb zu entfernen
                Button(action: {
                    hotelType.removeFromCart(newItem: hotel)
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                }
                .frame(width: 40, height: 40)
                .background(Color.red)
                .clipShape(Circle())
                .padding()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.black.opacity(0.57), .black.opacity(0.47)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
        )
    }
}
