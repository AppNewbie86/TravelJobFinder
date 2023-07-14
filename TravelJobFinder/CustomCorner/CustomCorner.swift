import SwiftUI

// Die CustomCorner-Struktur implementiert das Shape-Protokoll und stellt eine benutzerdefinierte Form mit abgerundeten Ecken dar.
struct CustomCorner: Shape {
    var corner: UIRectCorner // Die Ecken, die abgerundet werden sollen.
    var radius: CGFloat // Der Radius der abgerundeten Ecken.
    
    // Die path(in rect: CGRect)-Funktion gibt einen Path zurück, der die abgerundeten Ecken repräsentiert.
    func path(in rect: CGRect) -> Path {
        // Ein UIBezierPath-Objekt wird erstellt, das die abgerundeten Ecken enthält.
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath) // Der Path wird zurückgegeben.
    }
}
