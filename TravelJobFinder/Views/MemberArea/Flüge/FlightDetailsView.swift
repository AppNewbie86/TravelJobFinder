
import SwiftUI

struct FlightDetailsView : View {
    @State private var departurePlaceIndex = 0
    @State private var arrivalPlaceIndex = 0
    
    let places = ["London", "New York", "Paris", "Tokyo"]
    
    var alignment: HorizontalAlignment = .leading
    var code: String
    var timing: String
    
    var body: some View {
        VStack(alignment: alignment, spacing: 6) {
            Picker("Departure Place", selection: $departurePlaceIndex) {
                ForEach(0..<places.count) { index in
                    Text(places[index]).tag(index)
                }
            }
            .pickerStyle(.menu)
            .foregroundColor(.black.opacity(0.8))
            .frame(maxWidth: .infinity)
            
            Text(code)
                .font(.title)
                .foregroundColor(.black)
            
            Text(timing)
                .font(.caption)
        }
    }
}

struct FlightDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailsView(code: "LON", timing: "23. Nov, 23.00 Uhr")
    }
}
