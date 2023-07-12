import SwiftUI

struct NewsPage: View {
    var body: some View {
        NavigationView {
            GeometryReader { dimensions in
                List {
                    ForEach(0..<8) { _ in
                        AsyncImage(url: URL(string: "https://picsum.photos/600")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 240) // Das Bild anpassen und die Höhe festlegen
                        } placeholder: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray.opacity(0.6))
                                    .frame(height: 240) // Platzhalter-Hintergrund für das Bild
                                ProgressView() // Ladeanzeige während das Bild geladen wird
                            }
                        }
                        .aspectRatio(3 / 2, contentMode: .fill) // Seitenverhältnis des Bildes
                        .cornerRadius(12) // Ecken des Bildes abrunden
                        .padding(.vertical) // Vertikaler Innenabstand
                        .shadow(radius: 4) // Schatteneffekt für das Bild
                    }
                    .listStyle(.inset) // Listenstil für die Liste festlegen
                    .navigationTitle("Home") // Titel der Navigationsleiste
                    .navigationBarTitleDisplayMode(.inline) // Darstellungsmodus des Navigationsleistentitels
                }
            }
        }
    }
}

struct NewsPage_Previews: PreviewProvider {
    static var previews: some View {
        NewsPage() // Vorschau der NewsPage
    }
}
