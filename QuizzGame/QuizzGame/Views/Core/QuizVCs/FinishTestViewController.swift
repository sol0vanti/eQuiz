import UIKit
import CoreData

class FinishTestViewController: UIViewController {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeSpentLabel: UILabel!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var finalScoreLabel: UILabel!
    @IBOutlet var resultLineLabel: UILabel!
    
    public var score: Int = 0
    public var totalQuestions: Int = 0
    public var nickname: String = ""
    public var timeSpent: Int = 0
    private let date = Date()
    private let dateFormatter = DateFormatter()
    public let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    public var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Result"
        
        setUpLabels()
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let result = dateFormatter.string(from: date)
        dateLabel.text = result
        
        let person = Person( context: context)
        person.nickname = nickname
        person.date = result
        person.timeSpent = Int16(timeSpent)
        people.append(person)
        
        do {
            try self.context.save()
        }
        catch {
            fatalError("\(error)")
        }
    }
    
    @IBAction func returnHome(_ sender: UIButton) {
        view.isHidden = true
        navigationController?.popToRootViewController(animated: true)
        QuizResultsTableViewController().totalQuestions = totalQuestions
    }
}

extension FinishTestViewController {
    func setUpLabels() {
        resultLineLabel.text = "\(score) out of \(totalQuestions) Questions"
        finalScoreLabel.text = "\(score*25)/\(totalQuestions*25)"
        nicknameLabel.text = nickname
        timeSpentLabel.text = "\(timeSpent) seconds"
    }
}

