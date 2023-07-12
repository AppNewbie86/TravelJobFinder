import SwiftUI

struct CircleGroupView: View {
    // MARK: - PROPERTY
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false

    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10) // Unschärfeeffekt
        .opacity(isAnimating ? 1 : 0) // Sichtbarkeitseffekt
        .scaleEffect(isAnimating ? 1 : 0.5) // Skalierungseffekt
        .animation(.easeOut(duration: 1), value: isAnimating) // Animationsparameter
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

// MARK: - PREVIEW
struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(ShapeColor: .yellow, ShapeOpacity: 0.2)
        }
    }
}
