
import SwiftUI

struct FlightDetailView: View {
    
    var flight: Flights
    
    @EnvironmentObject var flightType : FlightTypeViewModel
    @State var rotationAngle = 0.0

    init(flight: Flights){
        self.flight = flight
    }
    
    @State var remainingTime = 3600 // an example initial value
    
    let countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.white.opacity(0.97), .white.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .center, spacing: 10){
                    
                    HStack(alignment: .top){
                        Image(flight.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3))
                            .shadow(radius: 7)
                            .rotationEffect(.degrees(rotationAngle))
                            .animation(Animation.linear(duration: 2).repeatForever())

                    }
                    
                    Text(flight.name)
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .accessibility(label: Text("Flight Name"))
                    
                    Text(flight.description)
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                        .accessibility(label: Text("Flight Description"))
                    
                    Text("Duration: \(flight.duration)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .accessibility(label: Text("Flight Duration"))
                    
                    Text("Departure Time: \(flight.departureTime)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .accessibility(label: Text("Flight Departure Time"))
                    
                    Text("Arrival Time: \(flight.arrivalTime)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .accessibility(label: Text("Flight Arrival Time"))
                    
                    Text("Origin: \(flight.origin)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .accessibility(label: Text("Flight Origin"))
                    
                    Text("$\(flight.price)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                        .accessibility(label: Text("Flight Price"))
                    
                    Button(action: {
                        withAnimation {
                            flightType.addFlights(newItem: flight)
                            print("Added to the flight booking list")
                        }
                    }) {
                        Text("Book Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 16)
                            .background(
                                Capsule()
                                    .foregroundColor(Color(red: 75 / 255, green: 115 / 255, blue: 115 / 255)))

                    }
                    .shadow(radius: 10)
                    .padding(.top, 40)
                    .padding(.bottom, 60)
                    
                    // Countdown Widget
                    CountdownCircle(remainingTime: Double(remainingTime))
                        .frame(width: 120, height: 120)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.7))
                    .shadow(radius: 7)
            )
        }
        .onReceive(countdownTimer) { currentDate in
            let endTime = Date(timeIntervalSinceReferenceDate: TimeInterval(remainingTime))
            _ = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: endTime)
            remainingTime -= 1
            
            if remainingTime < 0 {
                countdownTimer.upstream.connect().cancel()
            }
        }
    }
}
