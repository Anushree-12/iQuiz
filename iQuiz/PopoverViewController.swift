//
//  PopoverViewController.swift
//  iQuiz
//
//  Created by Anushree Gopal on 11/19/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var txtField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "PopoverSegue"?:
            let destination = segue.destination as! ViewController
            destination.url = URL(string: txtField.text!)
        default:
            NSLog("Unknown segue identifier:" + segue.identifier!)
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
