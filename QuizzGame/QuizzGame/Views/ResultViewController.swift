//
//  ResultViewController.swift
//  QuizzGame
//
//  Created by Alex on 11.06.2023.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var finalScoreLabel: UILabel!
    @IBOutlet var resultLineLabel: UILabel!
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScoreLabel.text = "\(score*25)"
        resultLineLabel.text = "\(score) out of 4 Questions"
        navigationItem.title = "Result"
    }
}
