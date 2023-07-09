

// Der Button zeigt ein Warenkorb-Symbol an, das durch das Symbolsystem "cart" dargestellt wird. Das Symbol wird mit einer leichten oberen Abstand (padding(.top, 8)) versehen, um es optisch auszurichten.

//  Anzahl der Elements im Warenkorb größer als 0 ist, wird die Anzahl in einem roten Kreis angezeigt. Dafür wird ein Text mit der Anzahl erstellt und gestaltet.


import SwiftUI

struct BookingCartButton: View {
    var numberOfItems: Int // Anzahl der Elemente im Warenkorb

    var body: some View {
        // Zeige einen Warenkorb-Symbol-Button in der oberen rechten Ecke an
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 8)

            // Wenn es Elemente im Warenkorb gibt, zeige die Anzahl der Elemente in einem roten Kreis an
            if numberOfItems > 0 {
                Text("\(numberOfItems)")
                    .font(.caption2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 25, height: 25)
                    .background(Color.red)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

struct BookingCartButton_Previews: PreviewProvider {
    static var previews: some View {
        BookingCartButton(numberOfItems: 1)
    }
}

