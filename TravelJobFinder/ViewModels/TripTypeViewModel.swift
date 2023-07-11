import Foundation
import MapKit


//MARK: MODEL VIEW
@MainActor
class TripTypeViewModel : ObservableObject {
    
    
    
    @Published var activities : [Activities] = []
    @Published var places : [Places] = []
    @Published var total : Int = 0
    @Published var searchText : String = ""
    
    // Function zum Wählen des Events
   
    func addActivities(newItem: Activities) {
       
        activities.append(newItem)
        total += newItem.price
    }
    
    // Function zum Entfernen von der Warenkorb Karte
    
    func removeFromCart (newItem: Activities){
        
        activities = activities.filter{ $0.id != newItem.id}
        total -= newItem.price
    }
    
}
    

