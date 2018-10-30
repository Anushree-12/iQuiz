//
//  AppData.swift
//  iQuiz
//
//  Created by Anushree Gopal on 10/29/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class AppData: NSObject {
    static let shared = AppData()
    
    open var subjects: [String] = ["Mathematics", "Marvel Super Heroes", "Science"]
    open var descr: [String] = ["Numbers...", "Can't wait for Captain Marvel!", "Mitochondria is the powerhouse?"]
    open var index = 0
    
    open var mathQ1: [String] = ["Y * 7 = 42. What is Y?"]
    open var mathA1: [String] = ["4", "5", "6", "7"] //6
    
    open var mathQ2: [String] = ["What is the value of Pi?"]
    open var mathA2: [String] = ["3.142", "4.562", "3.784", "4.341"] //3.142
    
    open var marvelQ1: [String] = ["Peter Parker works as a photpgrapher for?"]
    open var marvelA1: [String] = ["The Daily Planet", "The New York Times", "The Rolling Stone", "The Daily Bugle"] //The Daily Bugle
    
    open var marvelQ2: [String] = ["What is the name of the Avenger's mode of transport?"]
    open var marvelA2: [String] = ["The Blackhawk", "The Blackbird", "The Quinjet", "A bus"] //The Quinjet
    
    open var scienceQ1: [String] = ["Which is not energy we get from the sun?"]
    open var scienceA1: [String] = ["Heat", "Light", "Kinetic", "Potential"] //Kinetic
    
    open var sienceQ2: [String] = ["Which travels faster in a lighntning storm?"]
    open var scienceA2: [String] = ["No idea", "Thunder", "Lightning", "Same time"] // Lightning
}
