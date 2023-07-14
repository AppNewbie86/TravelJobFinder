
import SwiftUI

struct BookingView: View {
    var flight: String
    var hotel: String
    var activity: String
    
    @State private var isDropDownOpen = false
    @State private var selectedClass: TravelClass = .firstClass
    @State private var isTicketDetailsOpen = false
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.isDropDownOpen.toggle()
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .padding()
                
                Text("Buchungsdetails")
                    .font(.title)
                    .padding()
                
                Text("Flug: \(flight)")
                    .padding()
                
                Text("Hotel: \(hotel)")
                    .padding()
                
                Text("Aktivität: \(activity)")
                    .padding()
                
                Spacer()
                
                Text("Klasse auswählen:")
                    .font(.headline)
                    .padding()
                
                HStack(spacing: 16) {
                    TicketShape(shape: .firstClass, isSelected: selectedClass == .firstClass)
                        .onTapGesture {
                            selectedClass = .firstClass
                        }
                    
                    TicketShape(shape: .secondClass, isSelected: selectedClass == .secondClass)
                        .onTapGesture {
                            selectedClass = .secondClass
                        }
                    
                    TicketShape(shape: .businessClass, isSelected: selectedClass == .businessClass)
                        .onTapGesture {
                            selectedClass = .businessClass
                        }
                    
                    TicketShape(shape: .studentClass, isSelected: selectedClass == .studentClass)
                        .onTapGesture {
                            selectedClass = .studentClass
                        }
                }
                .padding(.horizontal)
                
                Button(action: {
                    self.isTicketDetailsOpen.toggle()
                }) {
                    Text("Ticket ausfüllen")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isTicketDetailsOpen) {
                    // Ticket-Details anzeigen und bearbeiten
                    // Hier kannst du eine separate View erstellen, die die Ticket-Details darstellt und sie hier anzeigen
                    TicketDetailsView(selectedClass: selectedClass)
                }
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Buchung")
        }
    }
}
struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(flight: "Flight Details", hotel: "Hotel Details", activity: "Activity Details")
    }
}
