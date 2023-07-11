import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Datenschutzrichtlinie")
                    .font(.largeTitle)
                    .fontWeight(.bold) // Überschrift für die Datenschutzrichtlinie

                Text("Willkommen bei unserer App. Diese Datenschutzrichtlinie beschreibt, wie wir Ihre Daten erfassen, verwenden und schützen, wenn Sie unsere App nutzen. Bitte lesen Sie diese Richtlinie sorgfältig durch, um zu verstehen, wie wir mit Ihren Daten umgehen.") // Einführungstext zur Datenschutzrichtlinie

                Group {
                    Text("1. Erfasste Daten")
                        .font(.headline) // Überschrift für die erste Information
                    Text("Wir erfassen nur die Daten, die Sie uns freiwillig zur Verfügung stellen, wie z.B. Ihren Benutzernamen und Ihre E-Mail-Adresse. Wir speichern diese Daten sicher und verwenden sie nur für den vorgesehenen Zweck.") // Information zur Erfassung von Daten

                    Text("2. Verwendung der Daten")
                        .font(.headline) // Überschrift für die zweite Information
                    Text("Wir verwenden Ihre Daten, um Ihnen personalisierte Dienste und Funktionen anzubieten. Wir geben Ihre Daten nicht an Dritte weiter, es sei denn, dies ist gesetzlich vorgeschrieben.") // Information zur Verwendung von Daten

                    Text("3. Datensicherheit")
                        .font(.headline) // Überschrift für die dritte Information
                    Text("Wir ergreifen angemessene Maßnahmen, um Ihre Daten vor unbefugtem Zugriff oder Verlust zu schützen. Wir verwenden sichere Verschlüsselungstechnologien und implementieren Sicherheitsmaßnahmen, um Ihre Daten zu schützen.") // Information zur Datensicherheit

                    Text("4. Dauer der Datenspeicherung")
                        .font(.headline) // Überschrift für die vierte Information
                    Text("Wir speichern Ihre Daten nur so lange, wie es für den vorgesehenen Zweck erforderlich ist. Wenn Sie Ihr Konto löschen, werden Ihre Daten aus unseren Systemen entfernt.") // Information zur Dauer der Datenspeicherung

                    // Weitere Informationen hier hinzufügen...
                }
                .padding(.top, 16) // Oberer Abstand für die Informationen

                Text("Wenn Sie Fragen zu unserer Datenschutzrichtlinie haben, kontaktieren Sie uns bitte.") // Abschlusstext mit Kontaktinformationen
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 16) // Oberer Abstand für den Abschlusstext
            }
            .padding(.horizontal, 16) // Horizontaler Innenabstand
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView() // Vorschau der PrivacyPolicyView
    }
}
