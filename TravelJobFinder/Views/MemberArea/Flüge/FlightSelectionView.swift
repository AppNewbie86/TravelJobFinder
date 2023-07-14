

import SwiftUI

struct FlightSelectionView: View {
    // MARK: Aufstellen von Variablen
    var size: CGSize
    var safeArea: EdgeInsets
    @State private var navigateToFlightDetails: Bool = false
    
    // MARK: Gesture Properties
    @State var offsetY : CGFloat = 0
    @State var currentCardIndex : CGFloat = 0
    @StateObject var flightDetailsViewModel = FlightDetailsViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
                .zIndex(1)
            PaymentCardsView()
                .zIndex(0)
            PayButtonView()
            
            // Add more views and content here
        }
    }
   
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack {
            Image("Logo 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width * 0.4)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                // Add content to the HStack here
                FlightDetailsView(
                                  code: flightDetailsViewModel.departureFlight.code,
                                  timing: flightDetailsViewModel.departureFlight.timing)
                
                VStack(spacing: 8) {
                    Image(systemName: "chevron.right")
                    
                    Text("4h 13 min")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                FlightDetailsView(alignment: .trailing,
                                 
                                  code: flightDetailsViewModel.arrivalFlight.code,
                                  timing: flightDetailsViewModel.arrivalFlight.timing)
            }
            .padding(.top, 20)
            
            // MARK: AIRPLANE IMAGE VIEW
            
            Image("plane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 160)
                .padding(.bottom,-20)
        }
        .padding(15)
        .padding(.top, safeArea.top)
        .background {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color("IosGray"),
                            Color("Airred"),
                            Color("IosGray")
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
    }
    
    @ViewBuilder
    func PaymentCardsView() -> some View {
        VStack {
            Text("Wähle deine Bezahlmethode")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.vertical)
            
            GeometryReader {_ in
                VStack(spacing: 0) {
                    ForEach(sampleCards.indices, id: \.self) { index in
                        CardView(index: index)
                    }
                    .padding(.horizontal, 30)
                    .offset(y: offsetY)
                    .offset(y: currentCardIndex * -200.00)
                    
                    // MARK: Gradient View
                    Rectangle()
                        .fill(.linearGradient(colors: [
                            .clear,
                            .clear,
                            .clear,
                            .clear,
                            .white.opacity(0.3),
                            .white.opacity(0.7),
                            .white
                        ], startPoint: .top, endPoint: .bottom))
                        .allowsHitTesting(false)
                    
                    // MARK: PURCHASE BUTTON
                    NavigationLink(
                        destination: FlightDetailsView(
                            code: flightDetailsViewModel.departureFlight.code,
                            timing: flightDetailsViewModel.departureFlight.timing
                        )
                    ) {
                        Text("Confirm € 2500.00")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 10)
                            .background {
                                Capsule()
                                    .fill(Color("BlueTop").gradient)
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, safeArea.bottom == 0 ? 15 : safeArea.bottom)
                }
                .coordinateSpace(name: "SCROLL")
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        offsetY = value.translation.height * 0.3
                    })
                    .onEnded({ value in
                        let translation = value.translation.height
                        withAnimation(.easeInOut) {
                            if translation > 0 && translation > 100 && currentCardIndex > 0 {
                                currentCardIndex -= 1
                            }
                            if translation < 0  && -translation > 100 && currentCardIndex < CGFloat(sampleCards.count - 1) {
                                currentCardIndex += 1
                            }
                            offsetY = .zero
                        }
                    })
            )
        }
    }

    
    @ViewBuilder
    func CardView(index : Int) -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / size.height
            let constrainedprogress = progress > 1 ? 1 : progress < 0 ? 0 : progress
            
            Image(sampleCards[index].cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, height: size.height)
                .shadow(color: .black.opacity(0.14), radius: 8, x: 6, y: 6)
                .rotation3DEffect(.init(degrees: constrainedprogress * 40.0), axis: (x:1, y: 0, z:0), anchor: .bottom)
                .padding(.top, progress * -160.0)
                .offset(y: progress < 0 ? progress * 250 : 0)
        }
        .frame(height: 200)
        .zIndex(Double(sampleCards.count - index))
        .onTapGesture {
            print(index)
        }
    }
  
    struct FlightSelectionView_Previews: PreviewProvider {
        static var previews: some View {
            FlightSelectionView(
                size: CGSize(width: 375, height: 667),
                safeArea: EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
            )
        }
    }
}
