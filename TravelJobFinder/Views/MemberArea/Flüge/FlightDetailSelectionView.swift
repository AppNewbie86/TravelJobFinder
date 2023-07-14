

import SwiftUI

struct FlightDetailSelectionView: View {
    @StateObject private var flightSelectionViewModel = FlightSelectionViewModel()
    var size: CGSize
    var safeArea: EdgeInsets
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 0) {
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                    
                    Text("Dein Reiseauftrag wurde Erfolgreich übermittelt")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    
                    Text("Wir warten auf die Erfolgreiche Bestätigung")
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.8))
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 30)
                .padding(.bottom, 40)
                .background {
                    RoundedRectangle(cornerRadius: 15,style: .continuous)
                        .fill(.black.opacity(0.1))
                }
                
                HStack {
                    FlightDetailsView(
                                      code: flightSelectionViewModel.departureCode,
                                      timing: flightSelectionViewModel.departureTiming)
                    .foregroundColor(.black)
                    
                    VStack(spacing: 8) {
                        Image(systemName: "chevron.right")
                        
                        Text("4h 13 min")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                    }
                    
                    FlightDetailsView(alignment: .trailing,
                                      
                                      code: flightSelectionViewModel.arrivalCode,
                                      timing: flightSelectionViewModel.arrivalTiming)
                }
                .padding(15)
                .padding(.bottom, 70)
                .background {
                    RoundedRectangle(cornerRadius: 15,style: .continuous)
                        .fill(.ultraThinMaterial)
                }
                .padding(.top, -20)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, safeArea.top + 15)
        .padding([.horizontal,.bottom], 15)
        .background {
            Rectangle()
                .fill(Color("IosGray"))
                .padding(.bottom, 80)
        }
    }
}

struct FlightDetailSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailSelectionView(
            size: CGSize(width: 375, height: 667),
            safeArea: EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
        )
    }
}
