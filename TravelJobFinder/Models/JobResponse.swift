
import Foundation
struct JobResponse: Identifiable, Decodable {
    var id = UUID()
    
  let jobs: [Job]
  enum CodingKeys: String, CodingKey {
    case jobs
  }
}

struct Job: Decodable {
  let id: Int
  let title: String
  let companyName: String
  let category: String
  let postdate: String
  let location: String
  let salary: String
  let jobType: String
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case companyName = "company_name"
    case category
    case postdate = "publication_date"
    case location = "candidate_required_location"
    case salary
    case jobType = "job_type"
  }
}
