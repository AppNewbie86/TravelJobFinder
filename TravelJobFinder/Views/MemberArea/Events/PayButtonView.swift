import SwiftUI

//  Diese Ansicht repräsentiert einen Pay-Button
//  Button-Stil wurde auf .borderedProminent gesetzt, um den hervorgehobenen Look gemäß den iOS-Richtlinien zu erreichen. Die buttonBorderShape wurde auf .capsule festgelegt, um die Form des Buttons abgerundet darzustellen. Die controlSize wurde auf .large gesetzt, um die Größe des Buttons anzupassen.

//  Um einen visuellen Effekt zu erzeugen, wurde der Button mit einer leichten Unschärfe (blur) und einem Schatten (shadow) versehen.


struct PayButtonView: View {
    @State private var isAnimating: Bool = false
    @State private var showFlightDetailSelectionView = false
    var body: some View {
        VStack {
            // MARK: - HEADER
            
            ZStack {
                CircleGroupView(ShapeColor: .green, ShapeOpacity: 0.1)
                
                Button(action: {
                    // Aktion beim Klicken auf den Button
                    showFlightDetailSelectionView = true
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    
                    Text("Paymentprocess")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                } //: BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .blur(radius: 0.5)
                .shadow(color: .gray, radius: 20, x: 0, y: 10)
                .fullScreenCover(isPresented: $showFlightDetailSelectionView, content: {
                 //  FlightDetailsView(place: "London", code: "LON", timing: "23. Nov, 23.00 Uhr")
                 //  FlightDetailsView(place: "BARCELONA", code: "BAR", timing: "23. Nov, 00.00 Uhr")
                    FlightDetailSelectionView(
                        size: CGSize(width: 375, height: 667),
                        safeArea: EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
                    )
                })
            } //: ZSTACK
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })
        }
    }
}
