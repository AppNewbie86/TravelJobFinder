// Das Bild wird so eingestellt, dass es skalierbar ist.
// Das Bild wird so skaliert, dass es den verfügbaren Platz ausfüllt und das Seitenverhältnis beibehält.
// Das Bild wird über die sicheren Bereiche des Bildschirms hinweg angezeigt.
// Der Kontrast des Bildes wird auf 0,7 festgelegt, um die Sichtbarkeit zu verbessern.
// Es wird eine horizontale Liste der Aktivitäten erstellt, die bei Bedarf geladen wird, um eine bessere Leistung zu erzielen.
// DetailActivityView(activity: activity)): Dieser Code erstellt einen Navigationslink zu einer Detailansicht für eine bestimmte Aktivität. Stellen Sie sicher, dass Sie die DetailActivityView entsprechend implementieren.

// Text("Find your perfect activity...") }: Diese Modifizierer ermöglichen die Durchsuchbarkeit der Ansicht und zeigen den angegebenen Platzhaltertext an.
import SwiftUI

struct ActivityTripView: View {
    
    @StateObject var tripType = TripTypeViewModel()
    @State private var searchText = ""
    
    var filteredActivities: [Activities] {
        if searchText.isEmpty {
            return activities
        } else {
            return activities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
        
                Image("urlaubsbild")
                    .resizable()
                    .scaledToFill()
                    .overlay(Rectangle())
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(.black.opacity(0.75))
                    .contrast(0.7)
                    .offset(x: -0)
                    .opacity(01.05)
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.white.opacity(0.77),.white.opacity(0.77)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Text("Trips")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(filteredActivities, id: \.id) { activity in
                                NavigationLink(destination: DetailActivityView(activity: activity)) {
                                    VStack(alignment: .leading) {
                                        Image(activity.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 200, height: 200)
                                            .cornerRadius(10)
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 10)
                                        Text(activity.name)
                                            .fontWeight(.semibold)
                                            .padding(.leading, 20)
                                            .padding(.bottom, 5)
                                        Text("From $\(activity.price) per person")
                                            .foregroundColor(.gray)
                                            .padding(.leading, 20)
                                            .padding(.bottom, 5)
                                        Text(activity.description)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .padding(.leading, 20)
                                            .padding(.bottom, 5)
                                    }
                                    .background(Color.black).opacity(0.8)
                                    .padding(.all)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .padding(.bottom, 20)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 20)
                    Spacer()
                }
                .navigationTitle("Activities")
            }
            .searchable(text: $searchText) { // Änderung 2
                           Text("Find your perfect activity...")
                               .foregroundColor(.black) // Änderung 2
                       }
        }
    }
}
struct ActivityTripView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTripView()
    }
}
