//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Anushree Gopal on 11/5/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var tblSubjects: UITableView!
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    @IBOutlet weak var lblCorrect: UILabel!
    @IBOutlet weak var lblResponse: UILabel!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var subject : [String : Any] = [:]
    var index = 0
    var correctAns = 0
    var answer = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let questions = subject["questions"] as? [[String : Any]]
        let question = questions![index - 1] as [String : Any]
        let correct = question["answer"] as! String
        let answers = question["answers"] as! [String]
        let correctA = answers[Int(correct)! - 1]
        lblQuestion.text = question["text"] as? String
        lblAnswer.text = answer
        lblCorrect.text = correctA
        
        if answer == lblCorrect.text {
            lblResponse.text = "You got it!"
        } else {
            lblResponse.text = "Better luck next time!"
        }
        
        if index < (questions?.count)! {
            btnFinish.isEnabled = false
            btnFinish.alpha = 0
            btnNext.isEnabled = true
            btnNext.alpha = 100
        } else {
            btnFinish.isEnabled = true
            btnFinish.alpha = 100
            btnNext.isEnabled = false
            btnNext.alpha = 0
        }
        
    }
        
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "NextSegue"?:
            let source = segue.source as! AnswerViewController
            let destination = segue.destination as! QAViewController
            destination.subject = source.subject
            destination.index = index
            destination.correctAns = correctAns
        case "FinishSegue"?:
            let source = segue.source as! AnswerViewController
            let destination = segue.destination as! CompletedViewController
            destination.subject = source.subject
            destination.index = index
            destination.correctAns = correctAns
        default:
            NSLog("Unknown segue identifier: " + segue.identifier!)
            }
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
