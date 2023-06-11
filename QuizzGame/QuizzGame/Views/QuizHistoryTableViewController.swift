//
//  QuizHistoryTableViewController.swift
//  QuizzGame
//
//  Created by Alex on 10.06.2023.
//

import UIKit

class QuizHistoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "History"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
