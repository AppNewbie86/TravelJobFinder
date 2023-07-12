
import SwiftUI

struct FlightListView: View {
    @StateObject var flightType = FlightTypeViewModel()
    @Binding var flightListViewIsShowing: Bool
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.black.opacity(0.97), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                Image("flightsearchbg")
                    .resizable()
                    .ignoresSafeArea(.all)
                    .opacity(0.33)
                
                VStack {
                    SearchBarHomeRow(text: $text)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 40)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 10) {
                            ForEach(flightType.flightList.filter({ text.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(text) })) { flight in
                                NavigationLink(
                                    destination: FlightDetailView(flight: flight)
                                        .environmentObject(Cart1()),
                                    label: {
                                        FlightButton(name: flight.name, image: flight.image)
                                            .frame(height: 80)
                                            .foregroundColor(.white)
                                            .cornerRadius(6)
                                            .padding(.horizontal, 16)
                                    }
                                )
                            }
                        }
                        .padding(.horizontal, 20)
                        .background(Color.gray)
                        .cornerRadius(30)
                        .padding(.top, 20)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct FlightListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightListView(flightListViewIsShowing: .constant(true))
    }
}
