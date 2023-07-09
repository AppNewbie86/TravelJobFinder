// besteht aus einer HStack, die ein Lupe-Symbol, ein Textfeld und ein Lösch-Symbol (X) enthält.

// Der Text im Suchfeld wird durch die Binding-Variable text gebunden, und der Placeholder-Text wird durch die übergebene placeholder-Variable festgelegt.

// Wenn der Text im Textfeld nicht leer ist, wird ein Button mit einem Lösch-Symbol angezeigt.


import SwiftUI

struct SearchBarView3: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass") // Symbol für die Lupe
                .foregroundColor(.secondary) // Sekundäre Textfarbe

            TextField(placeholder, text: $text) // Textfeld mit Placeholder und Binding an die Variable text
                .foregroundColor(.primary) // Primäre Textfarbe

            if !text.isEmpty { // Wenn der Text nicht leer ist
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill") // Symbol zum Löschen des Textes
                        .foregroundColor(.secondary) // Sekundäre Textfarbe
                }
            }
        }
        .padding()
        .background(Color(.systemGray6)) // Hintergrundfarbe
        .cornerRadius(8) // Abrundung der Ecken
        .padding(.horizontal)
    }
}
