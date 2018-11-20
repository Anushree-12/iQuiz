//
//  CompletedViewController.swift
//  iQuiz
//
//  Created by Anushree Gopal on 10/30/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {
    
    @IBOutlet weak var tblSubjects: UITableView!
    
    @IBOutlet weak var lblCorrect: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblResponse: UILabel!
    
    var subject : [String : Any] = [:]
    var index = 0
    var correctAns = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCorrect.text = String(correctAns)
        lblTotal.text = String(index)
        let percentage = Double(correctAns) / Double(index)
        var response = ""
        if percentage == 1 {
            response = "You're smart!"
        } else if percentage >= 0.5 {
            response = "So close!"
        } else if percentage >= 0.2 {
            response = "Good try!"
        } else {
            response = "Maybe you should try again!"
        }
        lblResponse.text = response
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
