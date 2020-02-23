//
//  ViewController.swift
//  Shamaz
//
//  Created by Gabriel Balta on 21/02/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaultText = "Tell us something about you from your"
    
    let pastStartArray = ["How was your best moment in last ",
                          "What extraordinary happend to you in last ",
                          "Describe your worst experience in last ",
                          "Where have you been at in last "]

    let futureStartArray = ["What is your goal in next ",
                            "Which person would you like to see in next ",
                            "Where will you be in next ",
                            "How many movies will you watch in next "]

    let endArray = ["day", "week", "month", "year"]

    
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var whoBtn: RoundButton!
    @IBOutlet weak var stackPastFutureBtns: UIStackView!
    
    
    // Navigation bar textAttributes change, before view is on screen -> questionTextLabel filled with default
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 50)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        questionTextLabel.text = defaultText
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    
    func buttonsHide(){
        if stackPastFutureBtns.isHidden == false {
            stackPastFutureBtns.isHidden = true
            whoBtn.isHidden = false
        } else {
            stackPastFutureBtns.isHidden = false
            whoBtn.isHidden = true
        }
    }
    
    
    @IBAction func futureBtnPressed(_ sender: RoundButton) {
        buttonsHide()
        questionTextLabel.text = makeQuestion(start: futureStartArray, end: endArray, number: Int.random(in: 1...10))
        
    }
    
    
    @IBAction func pastBtnPressed(_ sender: RoundButton) {
        buttonsHide()
        questionTextLabel.text = makeQuestion(start: futureStartArray, end: endArray, number: Int.random(in: 1...10))
    }
    
    @IBAction func whoBtnPressed(_ sender: RoundButton) {
        
    }
    
    @IBAction func resetBtnPressed(_ sender: UIBarButtonItem) {
        questionTextLabel.text = defaultText
        if stackPastFutureBtns.isHidden == true {
                stackPastFutureBtns.isHidden = false
                whoBtn.isHidden = true
        }
    }
    
}

