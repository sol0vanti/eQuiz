import UIKit

class EnterQuizViewController: UIViewController {
    @IBOutlet var nicknameEntry: UITextField!
    @IBOutlet var startButton: UIButton!
    
    public var timeSpent: Int = 0
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startClicked(_ sender: UIButton) {
        if nicknameEntry.hasText {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "QuizGameViewController") as? QuizViewController
            vc?.nicknameText = nicknameEntry.text ?? "Unknown"
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            let ac = UIAlertController(title: "Enter Nickname", message: "You forgot to write your nickname. Please fill the entry to enter the quiz", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
        }
    }
}

