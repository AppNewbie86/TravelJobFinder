import Combine
import Foundation
import SwiftUI

// Die JobListViewModel-Klasse stellt ein ViewModel für eine Liste von Jobs dar.

@MainActor
class JobListViewModel: ObservableObject {
    // Die searchTerm-Eigenschaft wird verwendet, um nach Jobs zu suchen.
    @Published var searchTerm: String = " "
    
    // Die jobs-Eigenschaft enthält eine Liste von JobViewModels.
    @Published public private(set) var jobs: [JobViewModel] = []
    
    private let dataModel: DataModel = DataModel()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        // Beim Initialisieren des JobListViewModels werden die Jobs geladen und in der jobs-Liste gespeichert.
        // Der Standardwert für searchTerm ist ein Leerzeichen, aber dieser Wert kann später geändert werden, um nach bestimmten Jobs zu suchen.
        dataModel.loadJobs(searchTerm: "") { jobs in
            jobs.forEach { self.appendJob(job: $0) }
        }
        
        // Der searchTerm wird überwacht, und wenn sich der Wert ändert, werden die Jobs entsprechend geladen und aktualisiert.
        $searchTerm
            .sink(receiveValue: loadJobs(searchTerm:))
            .store(in: &disposables)
    }
    
    // Diese Methode lädt die Jobs basierend auf dem angegebenen searchTerm.
    private func loadJobs(searchTerm: String) {
        // Zuerst werden alle Jobs aus der Liste entfernt.
        jobs.removeAll()
        
        // Dann werden die Jobs basierend auf dem searchTerm geladen und in der jobs-Liste gespeichert.
        dataModel.loadJobs(searchTerm: searchTerm) { jobs in
            jobs.forEach { self.appendJob(job: $0) }
        }
    }

    // Diese Methode fügt einen Job der jobs-Liste hinzu.
    private func appendJob(job: Job) {
        let jobViewModel = JobViewModel(job: job)
        
        // Das Hinzufügen des JobViewModels zur jobs-Liste erfolgt auf dem Haupt-Dispatch-Queue, um sicherzustellen, dass die Benutzeroberfläche aktualisiert wird.
        DispatchQueue.main.async {
            self.jobs.append(jobViewModel)
        }
    }
}
