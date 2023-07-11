import SwiftUI
import Combine
import Foundation
import MapKit

struct DetailActivityView: View {
    var activity: Activities
    @EnvironmentObject var tripType: TripTypeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var mapRegion: MKCoordinateRegion
    
    init(activity: Activities) {
        self.activity = activity
        self._mapRegion = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: activity.latitude, longitude: activity.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white.opacity(0.97), .white.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .center, spacing: 10) {
                    HStack(alignment: .top) {
                        Image(activity.image)
                            .resizable()
                            .frame(width: 400, height: 300)
                            .cornerRadius(15)
                            .blur(radius: 0.3)
                            .shadow(color: .black, radius: 20, x: 0, y: 10)
                    }
                    VStack {
                        Text(activity.name)
                            .font(.title)
                            .foregroundColor(.orange)
                            .fontWeight(.black)
                            .blur(radius: 0.3)
                            .shadow(color: .black, radius: 20, x: 0, y: 10)
                        
                        Text(activity.description)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding()
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                        
                        Map(coordinateRegion: $mapRegion)
                            .cornerRadius(30)
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                            .frame(height: 250)
                    }
                    HStack(alignment: .top) {
                        Spacer()
                        
                        Button(action: {
                            tripType.addActivities(newItem: activity)
                        }) {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.green.opacity(0.4))
                                .shadow(color: .gray, radius: 20, x: 0, y: 10)
                                .blur(radius: 0.3)
                                .frame(width: 120, height: 60)
                                .font(.title)
                                .overlay(HStack {
                                    Text("Event Booking")
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.white)
                                })
                                .padding()
                        }
                        
                        Spacer()
                    }
                    
                }
                .ignoresSafeArea()
                .padding()
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationBarBackButtonHidden(true) // Hide the original back button
        .navigationBarItems(leading: backButton) // Add a custom back button
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
                .font(.title)
        }
        .padding(.all, 30)
        .hidden()
    }
}

struct DetailExperienceView_Previews: PreviewProvider {
    static let tripTide = TripTypeViewModel()
    @Namespace static var namespace
    
    static var previews: some View {
        DetailActivityView(activity: activities[0])
            .environmentObject(tripTide)
    }
}
