// MARK: definiert das Modell für ein JobResponse mit Parametern:

import Foundation

// eindeutig Identifierbar
// kann codierte Datenquelle decodieren.

struct JobResponse: Identifiable, Decodable {
    var id = UUID() // eindeutige Kennzeichen der JobResponse darstellt.
    
    // Ein Array von Job-Objekten, das die enthaltenen Jobs in der JobResponse repräsentiert.
    
  let jobs: [Job]
    
   // Die CodingKeys-Enumeration definiert die beim Decodieren verwendeten Schlüsselnamen
    
  enum CodingKeys: String, CodingKey {
    case jobs
  }
}
