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
    @IBOutlet weak var againBtn: RoundButton!
    
    
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
    
    func resetScreen(){
//        questionTextLabel.text = defaultText
        stackPastFutureBtns.isHidden = false
        whoBtn.isHidden = true
        againBtn.isHidden = true
        UIView.transition(with: questionTextLabel, duration: 0.7, options: [.curveLinear, .transitionCrossDissolve], animations: {
            self.questionTextLabel.text = self.defaultText
        }, completion: nil)
        self.questionTextLabel.font = self.questionTextLabel.font.withSize(36)
        }
    
    
    @IBAction func futureBtnPressed(_ sender: RoundButton) {
        buttonsHide()
        
        UIView.transition(with: questionTextLabel, duration: 0.7, options: [.curveLinear, .transitionCrossDissolve], animations: {
            self.questionTextLabel.text = makeQuestion(start: self.futureStartArray, end: self.endArray, number: Int.random(in: 1...10))
        }, completion: nil)
//        questionTextLabel.text = makeQuestion(start: futureStartArray, end: endArray, number: Int.random(in: 1...10))
        
    }
    
    
    @IBAction func pastBtnPressed(_ sender: RoundButton) {
        buttonsHide()
        
        UIView.transition(with: questionTextLabel, duration: 0.7, options: [.curveLinear, .transitionCrossDissolve], animations: {
            self.questionTextLabel.text = makeQuestion(start: self.pastStartArray, end: self.endArray, number: Int.random(in: 1...10))
        }, completion: nil)
//        questionTextLabel.text = makeQuestion(start: pastStartArray, end: endArray, number: Int.random(in: 1...10))
    }
    
    @IBAction func whoBtnPressed(_ sender: RoundButton) {
        whoBtn.isHidden = true
        againBtn.isHidden = false
        stackPastFutureBtns.isHidden = true

        
        UIView.transition(with: questionTextLabel, duration: 0.7, options: [.curveLinear, .transitionCrossDissolve], animations: {
            self.questionTextLabel.font = self.questionTextLabel.font.withSize(120)
            self.questionTextLabel.text = String(Int.random(in: 1...10))
        }, completion: nil)
        
    }
    
    @IBAction func againBtnPressed(_ sender: Any) {
        resetScreen()
    }
    
    @IBAction func resetBtnPressed(_ sender: UIBarButtonItem) {
        resetScreen()
    }
    
}

