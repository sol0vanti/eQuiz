//
//  QuizViewController.swift
//  QuizzGame
//
//  Created by Alex on 10.06.2023.
//

import UIKit

class QuizViewController: UIViewController {
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
    
    var score = 0
    var correctAnswer = 0
    var question = 0
    var selectedButton = 0
    var progress = 0.0
    
    let questions = ["", "What's 4 + 4", "What's 2^3", "What's 4/2", "What's 5*4"]
    let correctAnswers = [69696969969, 8, 9, 2, 20]
    
    var nicknameText: String = ""
    
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
        if question == questions.count - 1 {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
            vc?.score = score
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            progress += 0.25
            progressiveView.setProgress(Float(progress), animated: true)
            scoreLabel.text = "Score: \(score)"
            question += 1
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
        }
    }
    
    @IBAction func selectFirstButtonOnce(_ sender: UIButton) {
        selectedButton = 0
        
        UIView.animate(withDuration: 0.4){
            self.buttonOne.backgroundColor = .systemGreen
            self.buttonOne.tintColor = .white
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
            self.buttonTwo.backgroundColor = .systemGreen
            self.buttonTwo.tintColor = .white
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
            self.buttonThree.backgroundColor = .systemGreen
            self.buttonThree.tintColor = .white
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
            self.buttonFour.backgroundColor = .systemGreen
            self.buttonFour.tintColor = .white
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
