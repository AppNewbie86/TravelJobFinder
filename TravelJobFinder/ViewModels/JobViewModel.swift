import Foundation

// Die JobViewModel-Klasse stellt ein ViewModel für einen Job dar.

@MainActor
class JobViewModel: Identifiable, ObservableObject {
    let id: Int
    let title: String
    let companyName: String
    let category: String
    let postdate: String
    let location: String
    let salary: String
    let jobType: String
    
    // Der JobViewModel-Initialisierer nimmt ein Job-Objekt entgegen und initialisiert die Eigenschaften des ViewModels mit den Werten des Jobs.

    init(job: Job) {
        self.id = job.id
        self.title = job.title
        self.companyName = job.companyName
        self.category = job.category
        self.postdate = job.postdate
        self.location = job.location
        self.salary = job.salary
        self.jobType = job.jobType
    }

    // Diese Klasse kann verwendet werden, um ein ViewModel für einen Job zu erstellen und die Eigenschaften des Jobs darin zu speichern.
    // Das ViewModel kann dann in der Benutzeroberfläche verwendet werden, um die Daten des Jobs anzuzeigen und zu verarbeiten.
}
