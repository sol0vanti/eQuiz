import UIKit

class QuizViewController: UIViewController {

    @IBOutlet var questionNumberLabel: UILabel!
    @IBOutlet var progressiveView: UIProgressView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nickname: UILabel!
    @IBOutlet var questionButtons: [UIButton]!
    @IBOutlet var questionView: UIView!
    @IBOutlet var dashedLineView: UIView!

    private var progress: Float {
        Float(currentQuestion + 1) / Float(questions.count)
    }

    public var score = 0
    private var correctAnswer = 0
    private var currentQuestion = 0
    private let questions = ["What's 4 + 4", "What's 2^3", "What's 4/2", "What's 5*4", "What's √25"]
    private let correctAnswers = [8, 16, 2, 20, 5]
    public var nicknameText = ""
    public var timeSpent: Int = 0
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
        
        drawDottedLine(start: CGPoint(x: dashedLineView.bounds.minX, y: dashedLineView.bounds.minY), end: CGPoint(x: dashedLineView.bounds.maxX, y: dashedLineView.bounds.minY), view: dashedLineView)
        
        for (i, button) in questionButtons.enumerated() {
            button.tag = i
            button.backgroundColor = .clear
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        questionView.layer.cornerRadius = 30
        nickname.text = nicknameText
        progressiveView.setProgress(Float(progress), animated: false)
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)

        displayQuestion()
    }

    @IBAction func didSelectButton(_ button: UIButton) {
        let isCorrect = button.tag == correctAnswer
        let backgroundColor: UIColor = isCorrect ? .systemGreen : .systemRed

        UIView.animate(withDuration: 0.4) { [weak button] in
            guard let button else { return }
            button.backgroundColor = backgroundColor
            button.tintColor = .white
        } completion: { [weak self, weak button] _ in
            UIView.animate(withDuration: 0.2) { [weak self, weak button] in
                self?.view.alpha = 0
                button?.backgroundColor = .white
                button?.tintColor = .lightGray
            } completion: { [weak self] _ in
                if isCorrect {
                    self?.score += 1
                }
                self?.nextQuestion()
                UIView.animate(withDuration: 0.2) { [weak self] in
                    self?.view.alpha = 1
                }
            }
        }
    }
}

private extension QuizViewController {
    
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
    
    func nextQuestion() {
        if currentQuestion == questions.count - 1 {
            moveToResults()
        } else {
            currentQuestion += 1
            displayQuestion()
        }
    }

    func moveToResults() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
        timer.invalidate()
        vc?.score = score
        vc?.totalQuestions = questions.count
        vc?.nickname = nicknameText
        vc?.timeSpent = timeSpent
    
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    }

    func displayQuestion() {
        guard currentQuestion < questions.count && currentQuestion < correctAnswers.count else { return }

        questionNumberLabel.text = "Question \(currentQuestion + 1)/\(questions.count)"
        progressiveView.setProgress(Float(progress), animated: true)
        scoreLabel.text = "Score: \(score)"
        questionLabel.text = questions[currentQuestion]

        for questionButton in questionButtons {
            let randomNumber = Int.random(in: 0...15, excluding: correctAnswers[currentQuestion])
            questionButton.setTitle("\(randomNumber)", for: .normal)
        }

        correctAnswer = Int.random(in: 0...3)
        questionButtons[correctAnswer].setTitle("\(correctAnswers[currentQuestion])", for: .normal)
    }
    
    @objc func updateTime() {
        timeSpent += 1
    }
    
    func reset(){
        currentQuestion = 0
        score = 0
        correctAnswer = 0
        currentQuestion = 0
        timeSpent = 0
    }
}
