import SwiftUI

struct HotelDetailView: View {
    let hotel: Hotel
    @ObservedObject var viewModel: HotelViewModel
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Image(hotel.imageName)
                        .resizable()
                        .cornerRadius(8)
                        .frame(height: 350)

                    Text(hotel.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Preis: \(hotel.price)")
                        .font(.headline)
                        .foregroundColor(.white)

                    
                    Text(hotel.description)
                        .font(.body)
                        .foregroundColor(.white)

                    
                    // Weitere Hotelinformationen hier hinzufügen...
                    HotelFeatureRow(icon: "wifi", title: "WLAN", isActive: hotel.wifi)
                    
                    Button(action: {
                        viewModel.bookHotel(hotel)
                    }) {
                        Text("Hotel buchen")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(
                                        Color(
                                            red: 75 / 255,
                                            green: 115 / 255,
                                            blue: 115 / 255
                                        )
                                    )
                            )
                            .cornerRadius(8)
                    }
                    
                    // Weitere Ansichtselemente und Funktionen hier hinzufügen...
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
struct HotelFeatureRow: View {
    let icon: String
    let title: String
    let isActive: Bool

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(isActive ? .green : .red)
            Text(title)
                .foregroundColor(.white)

            Spacer()
        }
    }
}

struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let hotel = Hotel(name: "Example Hotel", location: "City", price: "$100", description: "This is an example hotel.", imageName: "hotel1", wifi: true)
        let viewModel = HotelViewModel()
        HotelDetailView(hotel: hotel, viewModel: viewModel)
    }
}
