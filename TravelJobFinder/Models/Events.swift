import Foundation
import SwiftUI


struct Events : Identifiable {
    
    var id = UUID()
    let name : String
    let image : String
    let eventdescription : String
    let eventprice : Int
    let eventduration : String
    let eventTime : String
    let eventarrivalTime : String
    let eventorigin : String
   
}
