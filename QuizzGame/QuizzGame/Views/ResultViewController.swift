import UIKit

class ResultViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLineLabel.text = "\(score) out of \(totalQuestions) Questions"
        finalScoreLabel.text = "\(score*25)"
        nicknameLabel.text = nickname
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let result = dateFormatter.string(from: date)
        dateLabel.text = result
        
        timeSpentLabel.text = "\(timeSpent) seconds"
        
        navigationItem.title = "Result"
    }
    
    @IBAction func returnHome(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarController") as? UITabBarViewController
        
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    }
}

