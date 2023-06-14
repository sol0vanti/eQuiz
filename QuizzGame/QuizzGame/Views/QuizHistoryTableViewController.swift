import UIKit
import CoreData

class QuizHistoryTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var people: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        
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
        
        return cell
    }
}
