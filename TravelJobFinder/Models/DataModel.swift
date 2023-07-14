
import Foundation
import Alamofire

class DataModel {
    private var dataTask: URLSessionDataTask?
    private var baseUrl = URL(string: "https://remotive.io/api/remote-jobs/")

    // MARK: - Lädt Jobs aus der API anhand eines Suchbegriffs
    func loadJobs(searchTerm: String, completion: @escaping ([Job]) -> Void) {
        let url = buildUrl(forTerm: searchTerm)
        
        AF.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { (responseData) in
                guard let data = responseData.data else {
                    completion([])
                    return
                }
                
                // Versucht, das JobResponse-Objekt aus den empfangenen Daten zu decodieren
                if let jobResponse = try? JSONDecoder().decode(JobResponse.self, from: data) {
                    completion(jobResponse.jobs)
                }
            }
    }
    
    // MARK: - Baut die URL für den API-Aufruf basierend auf dem Suchbegriff
    private func buildUrl(forTerm searchTerm: String) -> URL? {
        guard !searchTerm.isEmpty else { return baseUrl }
        
        let queryItems = [URLQueryItem(name: "search", value: searchTerm)]
        var components = URLComponents(string: "https://remotive.io/api/remote-jobs")
        components?.queryItems = queryItems
        
        return components?.url
    }
}
