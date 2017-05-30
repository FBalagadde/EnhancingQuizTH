//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//
//  Modified by Frederick Balagadde on 5/29/2017
//  Project 2 - iOS Development TechDegree

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0
    
    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]
    
    
    @IBOutlet weak var ans1Button: UIButton!
    @IBOutlet weak var ans2Button: UIButton!
    @IBOutlet weak var ans3Button: UIButton!
    @IBOutlet weak var ans4Button: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var ansVerify: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var quizStatusLabel: UILabel!
    
    @IBOutlet weak var questionFrame: UIView!
    @IBOutlet weak var answersFrame: UIView!
    
    
    var corAnswer: String = ""

    
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeApp()
        displayQuestion()
        
        
        //let question: [String: String] = TriviaQuestionGenerator().newDisplayQuestion()
        
     
        
      
    }
    
    func initializeApp()
    {
        /////loadGameStartSound()
        // Start game
        /////playGameStartSound()
        
        //Initial conditions
        ansVerify.isHidden = true
        scoreLabel.isHidden = true
        nextButton.isHidden = true
        quizStatusLabel.isHidden = true
        
        let cornerRadius: CGFloat = 10
        ans1Button.layer.cornerRadius = cornerRadius
        ans2Button.layer.cornerRadius = cornerRadius
        ans3Button.layer.cornerRadius = cornerRadius
        ans4Button.layer.cornerRadius = cornerRadius
        nextButton.layer.cornerRadius = cornerRadius
        questionFrame.layer.cornerRadius = cornerRadius
        answersFrame.layer.cornerRadius = cornerRadius
        timeLabel.text = "15 sec"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion()
    {
        //Populate Question Field and Answer Fields with question information
        for (key, value) in TriviaQuestionGenerator().newDisplayQuestion()
        {
            switch key
            {
            case "Question": questionField.text = value
            case "Ans 1": ans1Button.setTitle(value, for: UIControlState())
            case "Ans 2": ans2Button.setTitle(value, for: UIControlState())
            case "Ans 3": ans3Button.setTitle(value, for: UIControlState())
            case "Ans 4": ans4Button.setTitle(value, for: UIControlState())
            case "Cor Ans": corAnswer = value
            default: print("unknown option")
                
            }
        }
        
        ansVerify.isHidden = true
        scoreLabel.isHidden = true
        nextButton.isHidden = true
        //quizStatusLabel.isHidden = true
        
        /*indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        let questionDictionary = trivia[indexOfSelectedQuestion]
        questionField.text = questionDictionary["Question"]
        playAgainButton.isHidden = true
 */
    }
    
    /*
    func displayScore() {
        // Hide the answer buttons
        trueButton.isHidden = true
        falseButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    
    @IBAction func ans4Button() {
    }
    
    
    @IBAction func ans3Button() {
    }
    
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["Answer"]
        
        if (sender === trueButton &&  correctAnswer == "True") || (sender === falseButton && correctAnswer == "False") {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
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
        trueButton.isHidden = false
        falseButton.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
 */
}

