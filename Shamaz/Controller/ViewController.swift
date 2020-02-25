//
//  ViewController.swift
//  Shamaz
//
//  Created by Gabriel Balta on 21/02/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Arrays
    // Arrays, each contains part of question
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

    // MARK: - IBOutlets
    // Outlet connections to VC
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var whoBtn: RoundButton!
    @IBOutlet weak var stackPastFutureBtns: UIStackView!
    @IBOutlet weak var againBtn: RoundButton!
    
    
    //MARK: - ViewAppear/Load
    // Navigation bar textAttributes change, before view is on screen -> questionTextLabel filled with default
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Customize navigationBarTextAttributes
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                          NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 60)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        questionTextLabel.text = defaultText
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    // Function to hide/unhide Past & Future button
    func buttonsHide(){
        if stackPastFutureBtns.isHidden == false {
            stackPastFutureBtns.isHidden = true
            whoBtn.isHidden = false
        } else {
            stackPastFutureBtns.isHidden = false
            whoBtn.isHidden = true
        }
    }
    
    // Function to change attributes of questionTextLabel + animation
    func questionTextLabelAttributes(textSize: Int = 60, labelText: String){
        UIView.transition(with: questionTextLabel, duration: 0.7, options: [.curveLinear, .transitionCrossDissolve], animations: {
            self.questionTextLabel.font = self.questionTextLabel.font.withSize(CGFloat(textSize))
            self.questionTextLabel.text = labelText
        }, completion: nil)
    }
    
    // Function defining what should happen to reset screen to default
    func resetScreen(){
        stackPastFutureBtns.isHidden = false
        whoBtn.isHidden = true
        againBtn.isHidden = true
        questionTextLabelAttributes(labelText: self.defaultText)
    }
    
    //MARK: - IBActions
    // Bar button and buttons action connections
    @IBAction func futureBtnPressed(_ sender: RoundButton) {
        buttonsHide()
        questionTextLabelAttributes(labelText: makeQuestion(start: self.futureStartArray, end: self.endArray, number: Int.random(in: 1...10)))
    }
    
    
    @IBAction func pastBtnPressed(_ sender: RoundButton) {
        buttonsHide()
        questionTextLabelAttributes(labelText: makeQuestion(start: self.pastStartArray, end: self.endArray, number: Int.random(in: 1...10)))
   }
    
    @IBAction func whoBtnPressed(_ sender: RoundButton) {
        whoBtn.isHidden = true
        againBtn.isHidden = false
        stackPastFutureBtns.isHidden = true
        questionTextLabelAttributes(textSize: 150,labelText: String(Int.random(in: 1...10)))
   }
    
    @IBAction func againOrResetBtnPressed(_ sender: Any) {
        resetScreen()
    }
}

