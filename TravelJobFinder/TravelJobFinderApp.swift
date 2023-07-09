//
//  TravelJobFinderApp.swift
//  TravelJobFinder
//
//  Created by Marcel Zimmermann on 05.07.23.
//

import SwiftUI

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct TravelJobFinderApp: App {
    @EnvironmentObject var authService : AuthService
    @StateObject private var tripTide = TripTypeViewModel()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(AuthService())
                .environmentObject(tripTide)

        }
    }
}
