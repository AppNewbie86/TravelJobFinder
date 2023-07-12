import SwiftUI

struct TermsOfServiceView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Nutzungsbedingungen")
                    .font(.largeTitle)
                    .fontWeight(.bold) // Überschrift für die Nutzungsbedingungen

                Text("Willkommen bei unserer App. Durch die Nutzung dieser App erklären Sie sich mit den folgenden Nutzungsbedingungen einverstanden:") // Einführungstext zu den Nutzungsbedingungen

                Group {
                    Text("1. Zustimmung zu den Bedingungen")
                        .font(.headline) // Überschrift für die erste Bedingung
                    Text("Bitte lesen Sie diese Nutzungsbedingungen sorgfältig durch und stimmen Sie ihnen zu, bevor Sie unsere App nutzen. Wenn Sie nicht mit diesen Bedingungen einverstanden sind, verwenden Sie die App bitte nicht.") // Text für die erste Bedingung

                    Text("2. Nutzung der App")
                        .font(.headline) // Überschrift für die zweite Bedingung
                    Text("Sie erklären sich damit einverstanden, die App nur zu legalen und angemessenen Zwecken zu nutzen. Sie stimmen zu, die App nicht für rechtswidrige Handlungen zu nutzen.") // Text für die zweite Bedingung

                    Text("3. Haftungsbeschränkung")
                        .font(.headline) // Überschrift für die dritte Bedingung
                    Text("Wir übernehmen keine Haftung für Schäden oder Verluste, die durch die Nutzung dieser App entstehen.") // Text für die dritte Bedingung

                    Text("4. Datenschutz")
                        .font(.headline) // Überschrift für die vierte Bedingung
                    Text("Ihre Privatsphäre ist uns wichtig. Bitte lesen Sie unsere Datenschutzrichtlinie, um zu erfahren, wie wir Ihre Daten verwenden und schützen.") // Text für die vierte Bedingung

                    // Weitere Bedingungen hier hinzufügen...
                }
                .padding(.top, 16) // Oberer Abstand für die Bedingungen

                Text("Wenn Sie Fragen zu diesen Nutzungsbedingungen haben, kontaktieren Sie uns bitte.") // Abschlusstext mit Kontaktinformationen
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 16) // Oberer Abstand für den Abschlusstext
            }
            .padding(.horizontal, 16) // Horizontaler Innenabstand
        }
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView() // Vorschau der TermsOfServiceView
    }
}
