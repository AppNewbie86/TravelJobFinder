import SwiftUI

struct HotelListView: View {
    @ObservedObject var viewModel = HotelViewModel() // View-Modell für die Hotelliste
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all) // Schwarzer Hintergrund
            
            NavigationView {
                List(viewModel.hotels) { hotel in // Liste der Hotels aus dem View-Modell
                    NavigationLink(destination: HotelDetailView(hotel: hotel, viewModel: viewModel)) { // Verlinkung zur Detailansicht des ausgewählten Hotels
                        HStack {
                            Image(hotel.image) // Laden des Bildes basierend auf dem imageName-Attribut des Hotels
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(hotel.name) // Anzeige des Hotelnamens
                                    .font(.headline)
                                Text(hotel.location) // Anzeige des Standorts des Hotels
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .navigationTitle("Hotels") // Titel der Navigationsleiste
            }
        }
    }
}

struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HotelViewModel() // View-Modell für die Vorschau
        viewModel.hotels = [
            Hotel(name: "Hilton", location: "London", price: "$200", description: "Luxuriöses Hotel im Herzen von London", image: "hotel1", wifi: true),
            Hotel(name: "Marriott", location: "New York", price: "$250", description: "Exquisites Hotel in der pulsierenden Stadt New York", image: "hotel2", wifi: true)
        ]
        
        return HotelListView(viewModel: viewModel) // Vorschau der HotelListView mit Beispiel-Hotels
    }
}
