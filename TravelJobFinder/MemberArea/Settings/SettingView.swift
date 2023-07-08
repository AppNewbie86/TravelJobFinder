//
//  SettingView.swift
//  TravelJobFinder
//
//  Created by Marcel Zimmermann on 07.07.23.
//

import SwiftUI


struct SettingView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Allgemein").font(.headline)) {
                    NavigationLink(destination: CreateProfileView()) {
                        Label("Profil erstellen", systemImage: "person")
                    }
                    
                    NavigationLink(destination: ChangePasswordView()) {
                        Label("Passwort vergessen", systemImage: "lock")
                    }
                }

                Section(header: Text("Benachrichtigungen").font(.headline)) {
                    Toggle(isOn: .constant(true)) {
                        Label("Push-Benachrichtigungen", systemImage: "bell")
                    }
                    Toggle(isOn: .constant(false)) {
                        Label("E-Mail-Benachrichtigungen", systemImage: "envelope")
                    }
                }
                
                Section(header: Text("Datenschutz").font(.headline)) {
                    NavigationLink(destination: TermsOfServiceView()) {
                        Label("Nutzungsbedingungen", systemImage: "doc.text")
                    }
                    NavigationLink(destination: PrivacyPolicyView()) {
                        Label("Datenschutz", systemImage: "shield")
                    }
                    
                }

                Section(header: Text("Konto").font(.headline)) {
                    Button(action: {
                        // Handle Logout
                    }) {
                        Label("Abmelden", systemImage: "arrowshape.turn.up.left")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Einstellungen")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
