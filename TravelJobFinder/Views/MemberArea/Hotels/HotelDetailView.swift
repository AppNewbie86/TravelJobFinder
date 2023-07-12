
import SwiftUI

struct HotelDetailView: View {
    let hotel: Hotel
    @ObservedObject var viewModel: HotelViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Image(hotel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding()
            
            Text(hotel.name)
                .font(.title)
                .padding(.bottom, 8)
            
            Text(hotel.location)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
            
            Text(hotel.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
            
            Spacer()
            
            Button(action: {
                viewModel.bookHotel(hotel)
            }) {
                Text("Hotel buchen")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.bottom, 32)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true) // Hide the original back button
        .navigationBarItems(leading: backButton) // Add a custom back button
        .navigationTitle("Hotel Details")
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
                .font(.title)
        }
        .padding(.all, 30)
        .hidden()
    }
}
