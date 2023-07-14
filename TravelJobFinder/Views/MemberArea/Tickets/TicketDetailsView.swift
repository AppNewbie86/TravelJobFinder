
import SwiftUI


struct TicketDetailsView: View {
    var selectedClass: TravelClass
    
    var body: some View {
        VStack {
            Text("Ticketdetails")
                .font(.title)
                .padding()
            
            Form {
                Section(header: Text("Klasse")) {
                    Text(selectedClass.description)
                }
                
                Section(header: Text("Name")) {
                    TextField("Vorname", text: .constant(""))
                    TextField("Nachname", text: .constant(""))
                }
                
                Section(header: Text("Reisepass")) {
                    TextField("Reisepassnummer", text: .constant(""))
                    TextField("Ausstellungsland", text: .constant(""))
                }
                
                // Weitere Informationen zur Ticketdetails hier hinzufügen
                
                Button(action: {
                    // Ticketdetails speichern oder absenden
                }) {
                    Text("Speichern")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct TicketDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketDetailsView(selectedClass: .firstClass)
    }
}
