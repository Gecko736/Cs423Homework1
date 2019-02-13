//
//  ViewController.swift
//  Notes
//
//  Created by Ben Rovik on 2/12/19.
//  Copyright © 2019 Ben Rovik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var answerLabel : UILabel!
    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var titleLabel : UILabel!
    
    
    @IBOutlet var button1 : UIButton!
    @IBOutlet var button2 : UIButton!
    
    @IBOutlet var textField : UITextField!
    
    let questions:[String] = [
        "Who plays the lead role in\nIt's Always Sunny in Philadelphia?",
        "Who hosts Fact Feind?",
        "Who voices Spongebob Squarepants?",
        "Who plays the lead role in The Flash?",
        "Who plays the lead role in\nEverybody Loves Raymond?",
        "Who voices the lead role in Final Space?",
        "Who voices the lead role in\nRick and Morty?"
    ]
    
    let answers = [
        "Danny Devito",
        "Karl Smallwood",
        "Tom Kenny",
        "Grant Gustin",
        "Ray Romano",
        "Olan Rogers",
        "Justin Roiland"
    ]
    
    var index : Int = 0
    
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did load")
        questionLabel.text = questions[index]
        answerLabel.text = " "
        textField.text = ""
        scoreLabel.text = "0/0"
        titleLabel.text = "Question 1/" + String(questions.count)
        button1.isEnabled = false
        questionLabel.numberOfLines = 2
        
        questionLabel.textAlignment = .center
        answerLabel.textAlignment = .center
        scoreLabel.textAlignment = .center
        textField.textAlignment = .center
        titleLabel.textAlignment = .center
        
        button1.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOffset = CGSize(width: 4, height: 4)
        button2.layer.shadowOffset = CGSize(width: 4, height: 4)
        titleLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        button1.layer.shadowRadius = 3
        button2.layer.shadowRadius = 3
        titleLabel.layer.shadowRadius = 5
        button1.layer.shadowOpacity = 0.75
        button2.layer.shadowOpacity = 0.75
        titleLabel.layer.shadowOpacity = 0.5
        
        titleLabel.font = UIFont.systemFont(ofSize: 30.0)
        titleLabel.adjustsFontSizeToFitWidth = true
        questionLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func showNextQuestion() {
        index += 1
        if (index >= questions.count) {
            index = 0
            score = 0
            scoreLabel.text = "0/0"
        }
        questionLabel.text = questions[index]
        answerLabel.text = " "
        button1.isEnabled = false
        button2.isEnabled = true
        textField.text = ""
        titleLabel.text = "Question " + String(index + 1) + "/" + String(questions.count)
    }
    
    @IBAction func showAnswer() {
        answerLabel.text = answers[index]
        button1.isEnabled = true
        if (textField.text == answers[index]) {
            score += 1
            answerLabel.textColor = UIColor.green
        }
        else {
            answerLabel.textColor = UIColor.red
        }
        scoreLabel.text = String(score) + "/" + String(index + 1)
//        self.view.endEditing(true)
        button2.isEnabled = false
    }

}

