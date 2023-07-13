import Foundation
import SwiftUI

// MARK: Erstellung eines Models names Card und deren Parameter

struct Card : Identifiable {
    
    var id = UUID()
    var cardImage: String
    
}

// MARK: ein Array sampleCards, das Elemente vom Typ Card enthält.

var sampleCards: [Card] = [
    Card(cardImage: "Card 1"),
    Card(cardImage: "Card 2"),
    Card(cardImage: "Card 3"),
    Card(cardImage: "Card 4")

]
