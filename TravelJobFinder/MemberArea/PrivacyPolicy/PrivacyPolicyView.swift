//
//  PrivacyPolicyView.swift
//  TravelJobFinder
//
//  Created by Marcel Zimmermann on 07.07.23.
//

import SwiftUI


struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Datenschutzrichtlinie")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Willkommen bei unserer App. Diese Datenschutzrichtlinie beschreibt, wie wir Ihre Daten erfassen, verwenden und schützen, wenn Sie unsere App nutzen. Bitte lesen Sie diese Richtlinie sorgfältig durch, um zu verstehen, wie wir mit Ihren Daten umgehen.")

                Group {
                    Text("1. Erfasste Daten")
                        .font(.headline)
                    Text("Wir erfassen nur die Daten, die Sie uns freiwillig zur Verfügung stellen, wie z.B. Ihren Benutzernamen und Ihre E-Mail-Adresse. Wir speichern diese Daten sicher und verwenden sie nur für den vorgesehenen Zweck.")

                    Text("2. Verwendung der Daten")
                        .font(.headline)
                    Text("Wir verwenden Ihre Daten, um Ihnen personalisierte Dienste und Funktionen anzubieten. Wir geben Ihre Daten nicht an Dritte weiter, es sei denn, dies ist gesetzlich vorgeschrieben.")

                    Text("3. Datensicherheit")
                        .font(.headline)
                    Text("Wir ergreifen angemessene Maßnahmen, um Ihre Daten vor unbefugtem Zugriff oder Verlust zu schützen. Wir verwenden sichere Verschlüsselungstechnologien und implementieren Sicherheitsmaßnahmen, um Ihre Daten zu schützen.")

                    Text("4. Dauer der Datenspeicherung")
                        .font(.headline)
                    Text("Wir speichern Ihre Daten nur so lange, wie es für den vorgesehenen Zweck erforderlich ist. Wenn Sie Ihr Konto löschen, werden Ihre Daten aus unseren Systemen entfernt.")

                    // Weitere Informationen hier hinzufügen...
                }
                .padding(.top, 16)

                Text("Wenn Sie Fragen zu unserer Datenschutzrichtlinie haben, kontaktieren Sie uns bitte.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 16)
            }
            .padding(.horizontal, 16)
        }
    }
}


struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
