import UIKit

class QuizViewController: UIViewController {
    @IBOutlet var questionNumberLabel: UILabel!
    @IBOutlet var progressiveView: UIProgressView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nickname: UILabel!
    @IBOutlet var questionButtons: [UIButton]!
    @IBOutlet var buttonFour: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var questionView: UIView!
    @IBOutlet var dashedLineView: UIView!
    
    public var score: Int = 0
    private var correctAnswer: Int = 0
    private var question: Int = 0
    private var selectedButton: Int = 0
    private var progress: Float = 0.0
    private let questions: [String] = ["What's 4 + 4", "What's 2^3", "What's 4/2", "What's 5*4", "What's √25"]
    private let correctAnswers: [Int] = [ 8, 16, 2, 20, 5]
    public var nicknameText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawDottedLine(start: CGPoint(x: dashedLineView.bounds.minX, y: dashedLineView.bounds.minY), end: CGPoint(x: dashedLineView.bounds.maxX, y: dashedLineView.bounds.minY), view: dashedLineView)
        
        for button in questionButtons {
            button.backgroundColor = .clear
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        questionView.layer.cornerRadius = 30
        nickname.text = nicknameText
        askQuestion()
        progressiveView.setProgress(Float(progress), animated: false)
    }
    
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.systemGray2.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3]
        
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
    
    func askQuestion() {
        if question == questions.count {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
            vc?.score = score
            vc?.totalQuestions = questions.count
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            questionNumberLabel.text = "Question \(question + 1)/\(questions.count)"
            progress += 0.2
            progressiveView.setProgress(Float(progress), animated: true)
            scoreLabel.text = "Score: \(score)"
            questionLabel.text = questions[question]
            
            for questionButton in questionButtons {
                var randomNumber = Int.random(in: 0...15)
                
                while randomNumber == correctAnswers[question] {
                    randomNumber = Int.random(in: 0...15)
                }
                questionButton.setTitle("\(randomNumber)", for: .normal)
            }
            
            correctAnswer = Int.random(in: 0...3)
            questionButtons[correctAnswer].setTitle("\(correctAnswers[question])", for: .normal)
            question += 1
        }
    }
    
    @IBAction func selectFirstButtonOnce(_ sender: UIButton) {
        selectedButton = 0
        UIView.animate(withDuration: 0.4){
            if self.selectedButton == self.correctAnswer {
                self.buttonOne.backgroundColor = .systemGreen
                self.buttonOne.tintColor = .white
            } else {
                self.buttonOne.backgroundColor = .systemRed
                self.buttonOne.tintColor = .white
            }
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.view.alpha = 0
                self.buttonOne.backgroundColor = .white
                self.buttonOne.tintColor = .lightGray
            } completion: { _ in
                if self.selectedButton == self.correctAnswer {
                    self.score += 1
                }
                self.askQuestion()
                UIView.animate(withDuration: 0.2) {
                    self.view.alpha = 1
                }
            }
        }
    }
    
    @IBAction func selectedSecondButton(_ sender: UIButton) {
        selectedButton = 1
        UIView.animate(withDuration: 0.4){
            if self.selectedButton == self.correctAnswer {
                self.buttonTwo.backgroundColor = .systemGreen
                self.buttonTwo.tintColor = .white
            } else {
                self.buttonTwo.backgroundColor = .systemRed
                self.buttonTwo.tintColor = .white
            }
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.view.alpha = 0
                self.buttonTwo.backgroundColor = .white
                self.buttonTwo.tintColor = .lightGray
            } completion: { _ in
                if self.selectedButton == self.correctAnswer {
                    self.score += 1
                }
                self.askQuestion()
                UIView.animate(withDuration: 0.2) {
                    self.view.alpha = 1
                }
            }
        }
    }
    
    @IBAction func selectedThirdButton(_ sender: UIButton) {
        selectedButton = 2
        UIView.animate(withDuration: 0.4){
            if self.selectedButton == self.correctAnswer {
                self.buttonThree.backgroundColor = .systemGreen
                self.buttonThree.tintColor = .white
            } else {
                self.buttonThree.backgroundColor = .systemRed
                self.buttonThree.tintColor = .white
            }
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.view.alpha = 0
                self.buttonThree.backgroundColor = .white
                self.buttonThree.tintColor = .lightGray
            } completion: { _ in
                if self.selectedButton == self.correctAnswer {
                    self.score += 1
                }
                self.askQuestion()
                UIView.animate(withDuration: 0.2) {
                    self.view.alpha = 1
                }
            }
        }
    }
    
    @IBAction func selectedFourthButton(_ sender: UIButton) {
        selectedButton = 3
        UIView.animate(withDuration: 0.4){
            if self.selectedButton == self.correctAnswer {
                self.buttonFour.backgroundColor = .systemGreen
                self.buttonFour.tintColor = .white
            } else {
                self.buttonFour.backgroundColor = .systemRed
                self.buttonFour.tintColor = .white
            }
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.view.alpha = 0
                self.buttonFour.backgroundColor = .white
                self.buttonFour.tintColor = .lightGray
            } completion: { _ in
                if self.selectedButton == self.correctAnswer {
                    self.score += 1
                }
                self.askQuestion()
                UIView.animate(withDuration: 0.2) {
                    self.view.alpha = 1
                }
            }
        }
    }
}
