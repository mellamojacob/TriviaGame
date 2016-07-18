//
//  Sounds.swift
//  TrueFalseStarter
//
//  Created by Jacob Virgin on 7/14/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import AudioToolbox

var gameSound: SystemSoundID = 0
var correctSound: SystemSoundID = 0
var incorrectSound: SystemSoundID = 0
var gameOverSound: SystemSoundID = 0


func loadGameStartSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &gameSound)
}

func playGameStartSound() {
    AudioServicesPlaySystemSound(gameSound)
}

func loadCorrectSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("correct", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &correctSound)
}

func playCorrectSound() {
    AudioServicesPlaySystemSound(correctSound)
}

func loadIncorrectSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("incorrect", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &incorrectSound)
}

func playIncorrectSound() {
    AudioServicesPlaySystemSound(incorrectSound)
}

func loadGameOverSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("gameOver", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &gameOverSound)
}

func playGameOverSound() {
    AudioServicesPlaySystemSound(gameOverSound)
}