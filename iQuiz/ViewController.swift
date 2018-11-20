//
//  ViewController.swift
//  iQuiz
//
//  Created by Anushree Gopal on 10/29/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var json: [[String:Any]] = [[:]]
    var url = URL(string: "http://tednewardsandbox.site44.com/questions.json")
   
    @IBOutlet weak var tblSubjects: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("numberOfRowsInSection called")
        return(json.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("Asking for indexPath \(indexPath)")
        let index = indexPath.row
        let subjCell = self.json[index] as [String:Any]  // WHAT IS SUBJECT CELL???
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = subjCell["title"] as? String
        cell.detailTextLabel?.text = subjCell["description"] as? String
        //cell.imageView?.image = 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subject = json[indexPath.row] as [String : Any]
        print(self.json[indexPath.row])
        NSLog(((subject["title"])! as? String)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        request(url: url!)
        tblSubjects.dataSource = self
        tblSubjects.delegate = self
        self.tblSubjects.reloadData()
        
        let filePath = getDocumentDirectory().appendingPathComponent("data.txt")
        let fileString = filePath.absoluteString
        
        (json as NSArray).write(toFile: fileString, atomically: true)
        self.tblSubjects.reloadData()
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func request(url: URL) {
        URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in guard let data = data, error == nil else { return}
            
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                self.json = jsonData
                self.tblSubjects.reloadData()
            } catch let error as NSError {
                print(error)
            }
        }).resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SVCSegue":
            let indexPath = tblSubjects.indexPathForSelectedRow!
            let source = segue.source as! ViewController
            let destination = segue.destination as! QAViewController
            destination.subject = source.json[indexPath.row]
            destination.index = 0
        case "PopoverSegue"?: break
        default:
            NSLog("Unknown segue identifier: " + segue.identifier!)
        }
    }
}
