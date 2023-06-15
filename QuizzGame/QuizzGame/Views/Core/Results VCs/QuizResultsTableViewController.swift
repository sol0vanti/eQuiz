import UIKit
import CoreData

class QuizResultsTableViewController: UITableViewController {
    @IBOutlet var noParticipants: UILabel!
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var people: [Person] = []
    public var totalQuestions: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Results"
        let reset = UIBarButtonItem(image: UIImage(systemName: "minus.circle.fill"), style: .done, target: self, action: #selector(resetPressed))
        reset.tintColor = .white
        navigationItem.rightBarButtonItems = [reset]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PersonCell else {
            fatalError("UNABLE TO DEQUEUE REUSABLE CELL")
        }
        
        let person = people[indexPath.item]
        
        cell.nickname.text = person.nickname
        cell.date.text = person.date
        cell.score.text = "\(person.score)/\(totalQuestions)"
        cell.timeSpent.text = "\(person.timeSpent) seconds"
        
        return cell
    }
}

extension QuizResultsTableViewController {
    override func viewDidAppear(_ animated: Bool) {
        fetchPeople()
    }
    
    func fetchPeople(){
        do {
            self.people = try context.fetch(Person.fetchRequest())
            self.tableView.reloadData()
        }
        catch {
            fatalError("\(error)")
        }
    }
    
    @objc func resetPressed() {
        let ac = UIAlertController(title: "Reset", message: "WARNING! \nBy clicking OK you reset all participants", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "CANCEL", style: .destructive))
        ac.addAction(UIAlertAction(title: "OK", style: .default){ _ in
            let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            do
            {
                try context.execute(deleteRequest)
                try context.save()
            }
            catch
            {
                print ("There was an error")
            }
            self.fetchPeople()
        })
        present(ac, animated: true)
    }
}
