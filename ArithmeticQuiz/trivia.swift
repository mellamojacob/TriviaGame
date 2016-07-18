//
//  Trivia.swift
//  TrueFalseStarter
//
//  Created by Jacob Virgin on 7/13/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import GameKit


struct trivia {
    var number: Int
    var firstNumber: Int
    var secondNumber: Int
    var question: String
    var answer: Double
    var options: [Double]
    
    
}


func getCorrectAnswer(question: trivia) ->Double {
    let firstNumber = Double(question.firstNumber)
    let secondNumber = Double(question.secondNumber)
    let number = question.number
    if number == 1 {
       return firstNumber * secondNumber
    } else if number == 2 {
        return firstNumber / secondNumber
    } else if number == 3 {
        return firstNumber + secondNumber
    } else {
        return firstNumber - secondNumber
    }
    
    
}

func getRandomInt(upperBound: Int) -> Int {
    return GKRandomSource.sharedRandom().nextIntWithUpperBound(upperBound)
}
func getRandomOption(questionNumber: Int) ->Double {
    if questionNumber == 1{
        return Double(getRandomInt(100) * getRandomInt(100))
    } else if questionNumber == 2 {
        return Double(getRandomInt(100)) / Double(getRandomInt(100))
    } else if questionNumber == 3{
        return Double(getRandomInt(100) + getRandomInt(100))
    } else {
        return Double(getRandomInt(100) - getRandomInt(100))
    }
    


}



func createQuestion(questionNumber: Int) -> trivia{
    var question: trivia
    var operation: String
    if questionNumber == 1 {
        operation = "*"
    } else if questionNumber == 2 {
        operation = "/"
    } else if questionNumber == 3 {
        operation = "+"
    } else {
        operation = "-"
    }

    question = trivia(number: questionNumber, firstNumber: getRandomInt(100), secondNumber: getRandomInt(100), question: "", answer: 0, options: [0, 0, 0, 0])

    question.question = "What is \(question.firstNumber) \(operation) \(question.secondNumber)?"
    question.answer = getCorrectAnswer(question)
    
    for i in 0 ..< 4 {
        question.options[i] = Double(getRandomOption(questionNumber))
    }
    
    question.options[getRandomInt(question.options.count)] = question.answer
    
    return question
}

func getQuestion() -> trivia {
    let question = createQuestion(getRandomInt(4))
    return question
}










