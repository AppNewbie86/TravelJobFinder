
import SwiftUI

struct HotelListView: View {
    @ObservedObject var viewModel = HotelViewModel()
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            NavigationView {
                List(viewModel.hotels) { hotel in
                    NavigationLink(destination: HotelDetailView(hotel: hotel, viewModel: viewModel)) {
                        HStack {
                            Image(hotel.imageName) // Bild basierend auf dem imageName-Attribut laden
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(hotel.name)
                                    .font(.headline)
                                Text(hotel.location)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                
                .navigationTitle("Hotels")
            }
        }
    }
}


struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HotelViewModel()
        viewModel.hotels = [
            Hotel(name: "Hilton", location: "London", price: "$200", description: "Luxuriöses Hotel im Herzen von London", imageName: "hotel1", wifi: true),
            Hotel(name: "Marriott", location: "New York", price: "$250", description: "Exquisites Hotel in der pulsierenden Stadt New York", imageName: "hotel2", wifi: true)
        ]
        
        return HotelListView(viewModel: viewModel)
    }
}
