//
//  QAViewController.swift
//  iQuiz
//
//  Created by Anushree Gopal on 10/29/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class QAViewController: UIViewController {
    
    @IBOutlet weak var tblSubjects: UITableView!
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var lblChosen: UILabel!
    
    
    var subject : [String : Any] = [:]
    var index = 0
    var correctAns = 0
    var answer = ""
    
    @IBAction func btnSetting(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSubmit.isEnabled = false
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as! [String : Any]
        let answers = question["answers"] as? [String]
        lblQuestion.text = question["text"] as? String
        btnA.setTitle(answers?[0], for: .normal)
        btnB.setTitle(answers?[1], for: .normal)
        btnC.setTitle(answers?[2], for: .normal)
        btnD.setTitle(answers?[3], for: .normal)
        print(subject)
    }
    
    @IBAction func AChosen(_ sender: Any) {
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as? [String : Any]
        let answers = question!["answers"] as? [String]
        lblChosen.text = answers?[0]
        btnSubmit.isEnabled = true
    }
    
    @IBAction func BChosen(_ sender: Any) {
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as? [String : Any]
        let answers = question!["answers"] as? [String]
        lblChosen.text = answers?[1]
        btnSubmit.isEnabled = true
    }
    
    
    @IBAction func CChosen(_ sender: Any) {
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as? [String : Any]
        let answers = question!["answers"] as? [String]
        lblChosen.text = answers?[2]
        btnSubmit.isEnabled = true
    }
    
    
    @IBAction func DChosen(_ sender: Any) {
        let questions = subject["questions"] as? [Any]
        let question = questions![index] as? [String : Any]
        let answers = question!["answers"] as? [String]
        lblChosen.text = answers?[3]
        btnSubmit.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SubmitSegue":
            answer = lblChosen.text!
            let source = segue.source as! QAViewController
            let destination = segue.destination as! AnswerViewController
            destination.subject = source.subject
            destination.answer = source.answer
            let questions = subject["questions"] as? [[String : Any]]
            let question = questions![index] as [String : Any]
            let correct = question["answer"]! as! String
            let answers = question["answers"] as! [String]
            if answer == answers[Int(correct)! - 1] {
                correctAns = correctAns + 1
            }
            index = index + 1
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
