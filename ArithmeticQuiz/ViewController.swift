//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var question: trivia = getQuestion()
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var buttonList: [UIButton] {
        return [option1, option2, option3, option4]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func displayQuestion() {
        question = getQuestion()
        questionField.text = question.question
        playAgainButton.hidden = true
        var i = 0
        for button in buttonList{
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            button.setTitle("\(question.options[i])", forState: .Normal)
            i += 1
        }
        
    }
    
    func displayScore() {
        // Hide the answer buttons
        for button in buttonList {
            button.hidden = true
        }
        
        // Display play again button
        playAgainButton.hidden = false
        
        
        loadGameOverSound()
        playGameOverSound()
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
        
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let correctAnswer = "\(question.answer)"
        
        if (sender.titleLabel?.text == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
            loadCorrectSound()
            playCorrectSound()
        } else {
            questionField.text = "Sorry, wrong answer!"
            loadIncorrectSound()
            playIncorrectSound()
        }
        for button in buttonList {
            if button.titleLabel?.text == correctAnswer{
                button.setTitleColor(UIColor.greenColor(), forState: .Normal)
            } else {
                button.setTitleColor(UIColor.grayColor(), forState: .Normal)
            }
        }
        
        
        loadNextRoundWithDelay(seconds: 4)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        for button in buttonList {
            button.hidden = false
        }
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    
    
    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    
}

