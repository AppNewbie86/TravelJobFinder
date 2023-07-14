
import Foundation
import SwiftUI

enum TravelClass {
    case firstClass
    case secondClass
    case businessClass
    case studentClass
    
    var description: String {
        switch self {
        case .firstClass:
            return "1. Klasse"
        case .secondClass:
            return "2. Klasse"
        case .businessClass:
            return "Business-Klasse"
        case .studentClass:
            return "Studentenklasse"
        }
    }
}
