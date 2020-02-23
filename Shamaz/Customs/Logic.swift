//
//  Logic.swift
//  Shamaz
//
//  Created by Gabriel Balta on 23/02/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import Foundation

func makeQuestion(start: Array<String>, end: Array<String>, number: Int) -> String {
    var question: String
    let questionForm = start.randomElement()! + String(number) + " " + end.randomElement()!
    
    if number == 1{
        question = questionForm + " ?"
    }else {
        question = questionForm + "s ?"
    }
    
    return question
}

