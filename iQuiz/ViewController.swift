//
//  ViewController.swift
//  iQuiz
//
//  Created by Anushree Gopal on 10/29/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var appData = AppData.shared
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(appData.subjects.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblView.dequeueReusableCell(withIdentifier: "quizCell") as! QuizCell
        cell.lblSubject.text = appData.subjects[indexPath.row]
        cell.lblDescr.text = appData.descr[indexPath.row]
        return(cell)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblView.dataSource = self
        tblView.delegate = self
    }
    
    @IBAction func btnSetting(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
