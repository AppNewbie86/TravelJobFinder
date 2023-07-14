import SwiftUI

struct FlightListView: View {
    @StateObject var flightType = FlightSelectionViewModel()
    @Binding var flightListViewIsShowing: Bool
    @State var text: String = ""
    @StateObject var cart = CartViewModel()
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            FlightSelectionView(size: size, safeArea: safeArea)
                .ignoresSafeArea(.all)
        }
    
    }
}
struct FlightListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightListView(flightListViewIsShowing: .constant(true))
    }
}
