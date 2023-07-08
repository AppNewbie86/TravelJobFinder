
import SwiftUI

struct TermsOfServiceView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Nutzungsbedingungen")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Willkommen bei unserer App. Durch die Nutzung dieser App erklären Sie sich mit den folgenden Nutzungsbedingungen einverstanden:")

                Group {
                    Text("1. Zustimmung zu den Bedingungen")
                        .font(.headline)
                    Text("Bitte lesen Sie diese Nutzungsbedingungen sorgfältig durch und stimmen Sie ihnen zu, bevor Sie unsere App nutzen. Wenn Sie nicht mit diesen Bedingungen einverstanden sind, verwenden Sie die App bitte nicht.")

                    Text("2. Nutzung der App")
                        .font(.headline)
                    Text("Sie erklären sich damit einverstanden, die App nur zu legalen und angemessenen Zwecken zu nutzen. Sie stimmen zu, die App nicht für rechtswidrige Handlungen zu nutzen.")

                    Text("3. Haftungsbeschränkung")
                        .font(.headline)
                    Text("Wir übernehmen keine Haftung für Schäden oder Verluste, die durch die Nutzung dieser App entstehen.")

                    Text("4. Datenschutz")
                        .font(.headline)
                    Text("Ihre Privatsphäre ist uns wichtig. Bitte lesen Sie unsere Datenschutzrichtlinie, um zu erfahren, wie wir Ihre Daten verwenden und schützen.")

                    // Weitere Bedingungen hier hinzufügen...
                }
                .padding(.top, 16)

                Text("Wenn Sie Fragen zu diesen Nutzungsbedingungen haben, kontaktieren Sie uns bitte.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 16)
            }
            .padding(.horizontal, 16)
        }
    }
}


struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
    }
}
