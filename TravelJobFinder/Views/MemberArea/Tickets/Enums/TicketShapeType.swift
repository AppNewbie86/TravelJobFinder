
import Foundation
import SwiftUI



enum TicketShapeType {
    case firstClass
    case secondClass
    case businessClass
    case studentClass
    
    var imageName: String {
        switch self {
        case .firstClass:
            return "star"
        case .secondClass:
            return "star.fill"
        case .businessClass:
            return "circle"
        case .studentClass:
            return "triangle"
        }
    }
    
    var color: Color {
        switch self {
        case .firstClass:
            return Color.red
        case .secondClass:
            return Color.blue
        case .businessClass:
            return Color.green
        case .studentClass:
            return Color.yellow
        }
    }
    
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
