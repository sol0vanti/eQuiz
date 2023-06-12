import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var finalScoreLabel: UILabel!
    @IBOutlet var resultLineLabel: UILabel!
    
    public var score: Int = 0
    public var totalQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScoreLabel.text = "\(score*25)"
        resultLineLabel.text = "\(score) out of \(totalQuestions) Questions"
        navigationItem.title = "Result"
    }
}
