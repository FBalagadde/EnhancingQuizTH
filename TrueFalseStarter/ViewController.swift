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
    
    var gameSound: SystemSoundID = 0
    var correctAnswerSound: SystemSoundID = 0
    var wrongAnswerSound: SystemSoundID = 0
    var endGameSound: SystemSoundID = 0
    var timeUpSound: SystemSoundID = 0
    
    var delaySeconds: Int = 5 //delay in questions
    var timePerQuestion: Float = 15.0
    
    var correctMark: String = "✔︎"
    var wrongMark: String = "✘"
    var emptyMark: String = "◻️"
    var corAnswer: String = ""
    var counter: Double = 15.0
    
    
    var question: TriviaQuestionGenerator = TriviaQuestionGenerator() //move this to the initialization section
    var timer = Timer()
   
    
    @IBOutlet weak var ans1Button: UIButton!
    @IBOutlet weak var ans2Button: UIButton!
    @IBOutlet weak var ans3Button: UIButton!
    @IBOutlet weak var ans4Button: UIButton!
    @IBOutlet weak var nextMoveButton: UIButton!
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var ansVerify: UILabel!
    @IBOutlet weak var ansVerify2: UILabel!
    @IBOutlet weak var ansVerify3: UILabel!
    @IBOutlet weak var ansVerify4: UILabel!
    @IBOutlet weak var startScreenLabel1: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionFrameLabel: UILabel!
    @IBOutlet weak var questionFrameLabel2: UILabel!
    @IBOutlet weak var correctAnsLabel1: UILabel!
    @IBOutlet weak var correctAnsLabel2: UILabel!
    @IBOutlet weak var correctAnsLabel3: UILabel!
    @IBOutlet weak var correctAnsLabel4: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        //New Code
        //var screenSize: CGRect = UIScreen.
        
        //New Code
        

        loadGameStartSound()
        loadCorrectAnswerSound()
        loadWrongAnswerSound()
        loadEndGameSound()
        loadTimeUpSound()
        initializeApp()
        displayStartGreeting()
    }
    
    func displayStartGreeting()
    {
     
        playGameStartSound()
        questionFrameLabel.isHidden = false
        startScreenLabel1.text = "Welcome to TRIVIA QUIZ.\n\nYou have \(timePerQuestion) seconds to answer each question.\n\nPress START below to begin."
        
        timerLabel.isHidden = true
        scoreLabel.isHidden = true
        
        startScreenLabel1.isHidden = false
        nextMoveButton.isHidden = false
        
        //loadNextRoundWithDelay(seconds: 5) //will change this to variable
        let delay = Int64(NSEC_PER_SEC * UInt64(delaySeconds)) ////will change this to variable
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime)
        {
            self.nextMoveButton.setTitle("START", for: UIControlState()) //change later to variable
            self.nextMoveButton.isEnabled = true
        }
    }
    
    
    /// Set the initial conditions of all the objects in the App
    /// The apps are initialized in the same order that they appear in the Main StoryBoard
    func initializeApp()
    {
        /////loadGameStartSound()
        // Start game
        /////playGameStartSound()
        
        //Initial conditions
        
        //Load and stylize frames
        let cornerRadius: CGFloat = 10 //will move
        let borderWidth: CGFloat = 2.0
        
        gameTitle.isHidden = false
        
        questionFrameLabel.layer.cornerRadius = cornerRadius
        questionFrameLabel.layer.borderColor = UIColor.white.cgColor
        questionFrameLabel.layer.borderWidth = borderWidth
        questionFrameLabel.isHidden = true
        
        questionFrameLabel2.layer.cornerRadius = cornerRadius
        questionFrameLabel2.layer.borderColor = UIColor.white.cgColor
        questionFrameLabel2.layer.borderWidth = borderWidth
        questionFrameLabel2.isHidden = true
        questionFrameLabel.layer.backgroundColor = UIColor.darkGray.cgColor
        
        startScreenLabel1.isHidden = true
        startScreenLabel1.layer.cornerRadius = cornerRadius
        
        
        questionNumberLabel.isHidden = true
        
        progressBar.progress = 0.0
        progressBar.isHidden = true
        
        questionField.isHidden = true
        
        ans1Button.isHidden = true
        ans1Button.layer.cornerRadius = cornerRadius
        ans1Button.isEnabled = false
        
        correctAnsLabel1.isHidden = true
        correctAnsLabel1.layer.cornerRadius = cornerRadius
        correctAnsLabel1.layer.borderWidth = borderWidth
        correctAnsLabel1.layer.borderColor = UIColor.green.cgColor
        
        ans2Button.isHidden = true
        ans2Button.layer.cornerRadius = cornerRadius
        ans2Button.isEnabled = false
        
        correctAnsLabel2.isHidden = true
        correctAnsLabel2.layer.cornerRadius = cornerRadius
        correctAnsLabel2.layer.borderWidth = borderWidth
        correctAnsLabel2.layer.borderColor = UIColor.green.cgColor
        
        ans3Button.isHidden = true
        ans3Button.layer.cornerRadius = cornerRadius
        ans3Button.isEnabled = false
        
        correctAnsLabel3.isHidden = true
        correctAnsLabel3.layer.cornerRadius = cornerRadius
        correctAnsLabel3.layer.borderWidth = borderWidth
        correctAnsLabel3.layer.borderColor = UIColor.green.cgColor
        
        ans4Button.isHidden = true
        ans4Button.layer.cornerRadius = cornerRadius
        ans4Button.isEnabled = false
        
        correctAnsLabel4.isHidden = true
        correctAnsLabel4.layer.cornerRadius = cornerRadius
        correctAnsLabel4.layer.borderWidth = borderWidth
        correctAnsLabel4.layer.borderColor = UIColor.green.cgColor
        
        ansVerify.isHidden = true
        ansVerify2.isHidden = true
        ansVerify3.isHidden = true
        ansVerify4.isHidden = true
        
        timerLabel.text = "Timer: \(timePerQuestion)"
        timerLabel.isHidden = true
        
        scoreLabel.isHidden = true
        scoreLabel.text = "Score: " + emptyMark + " " + emptyMark + " " + emptyMark + " " + emptyMark
        
        nextMoveButton.isHidden = true
        nextMoveButton.layer.cornerRadius = cornerRadius
        nextMoveButton.setTitle("", for: UIControlState())
        nextMoveButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func replaceStringChar(forString myString: String, atIndex index: Int, with newChar: String) -> String
    {
        var newString = ""
        var count: Int = 0
        
        for character in myString.characters
        {
            if count == index
            {
                newString += newChar
            }else {
                newString += String(character)
            }
            count += 1
        }
        return newString
    }
    
    func answerButtonPressedActions(answerOption: String, checkMarkNumber: UILabel, answerButton: UIButton)
    {
        let tempScoreLabelText: String = scoreLabel.text!
        
        if question.selectedQuestion["Cor Ans"] == answerOption
        {
            playCorrectAnswerSound()
            checkMarkNumber.text = correctMark
            question.incrementCorrectAnswers()
            scoreLabel.text = replaceStringChar(forString: tempScoreLabelText, atIndex: (7 + 2*(question.questionsAsked-1)), with: correctMark)
        } else {
            checkMarkNumber.text = wrongMark
            playWrongAnswerSound()
            scoreLabel.text = replaceStringChar(forString: tempScoreLabelText, atIndex: (7 + 2*(question.questionsAsked-1)), with: wrongMark)
            switch self.question.selectedQuestion["Cor Ans"]!
            {
                case "1": self.correctAnsLabel1.isHidden = false
                case "2": self.correctAnsLabel2.isHidden = false
                case "3": self.correctAnsLabel3.isHidden = false
                default: self.correctAnsLabel4.isHidden = false
            }
        }
    
        checkMarkNumber.isHidden = false
        scoreLabel.isHidden = false
        
        ans1Button.alpha = 0.5
        ans2Button.alpha = 0.5
        ans3Button.alpha = 0.5
        ans4Button.alpha = 0.5
        answerButton.alpha = 1.0
        
        ans1Button.isEnabled = false
        ans2Button.isEnabled = false
        ans3Button.isEnabled = false
        ans4Button.isEnabled = false

 
        
        
        if question.questionsAsked >= question.questionsPerRound
        {
            self.nextMoveButton.setTitle("", for: UIControlState()) //change later to variable
            
            
            //loadNextRoundWithDelay(seconds: 5) //will change this to variable
            let delay = Int64(NSEC_PER_SEC * UInt64(delaySeconds)) ////will change this to variable
            // Calculates a time value to execute the method given current time and delay
            let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
            
            // Executes the nextRound method at the dispatch time on the main queue
            DispatchQueue.main.asyncAfter(deadline: dispatchTime)
            {
                self.playEndGameSound()
                self.startScreenLabel1.text = "Way to go!\nYou got \(self.question.correctQuestions) out of \(self.question.questionsPerRound) correct.\n\n\nPress PLAY AGAIN below to play again"
                
                self.startScreenLabel1.isHidden = false
                self.timerLabel.isHidden = true
                //self.scoreLabel.isHidden = true
                
                self.ans1Button.isHidden = true
                self.ans2Button.isHidden = true
                self.ans3Button.isHidden = true
                self.ans4Button.isHidden = true
                self.progressBar.isHidden = true
                
                self.correctAnsLabel1.isHidden = true
                self.correctAnsLabel2.isHidden = true
                self.correctAnsLabel3.isHidden = true
                self.correctAnsLabel4.isHidden = true
                
                self.questionFrameLabel.isHidden = false
                self.questionFrameLabel2.isHidden = true
                
                //loadNextRoundWithDelay(seconds: 5) //will change this to variable
                let delay = Int64(NSEC_PER_SEC * UInt64(10)) ////will change this to variable
                // Calculates a time value to execute the method given current time and delay
                let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
                
                // Executes the nextRound method at the dispatch time on the main queue
                DispatchQueue.main.asyncAfter(deadline: dispatchTime)
                {
                    self.nextMoveButton.isEnabled = true
                    self.nextMoveButton.alpha = 1.0
                    self.nextMoveButton.setTitle("PLAY AGAIN", for: UIControlState()) //change later to variable
                }
                
            }
        } else {
            nextMoveButton.setTitle("Next Question", for: UIControlState()) //change later to variable
            
            nextMoveButton.isEnabled = true
            nextMoveButton.alpha = 1.0
        }
        
        timer.invalidate() //This pauses the timer
        timerLabel.text = "Timer: " + String(format: "%.1f", counter)
        
    } //end func answerButtonPressedActions()
 
   
    
    @IBAction func checkAnswer(_ sender: UIButton)
    {
        switch sender
        {
        case ans1Button:
            answerButtonPressedActions(answerOption: "1", checkMarkNumber: ansVerify, answerButton: ans1Button)
  
            
        case ans2Button:
            answerButtonPressedActions(answerOption: "2", checkMarkNumber: ansVerify2, answerButton: ans2Button)
            
        case ans3Button:
            answerButtonPressedActions(answerOption: "3", checkMarkNumber: ansVerify3, answerButton: ans3Button)

        case ans4Button:
            answerButtonPressedActions(answerOption: "4", checkMarkNumber: ansVerify4, answerButton: ans4Button)

        case nextMoveButton:
            nextMoveButton.isEnabled = false
            //loadNextRoundWithDelay(seconds: 0)
            

            //displayQuestion()
            
           
            if question.questionsAsked < question.questionsPerRound
            {
               self.displayQuestion()
            }else
            {
                //loadNextRoundWithDelay(seconds: 5) //will change this to variable
                let delay = Int64(NSEC_PER_SEC * UInt64(2)) ////will change this to variable
                // Calculates a time value to execute the method given current time and delay
                let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
                
                // Executes the nextRound method at the dispatch time on the main queue
                DispatchQueue.main.asyncAfter(deadline: dispatchTime)
                {
                    self.question = TriviaQuestionGenerator() //Refresh the question object
                    self.initializeApp()
                    self.displayQuestion()
                }
            }
        default: ansVerify.text = "Indeterminate" //This is a redundant statement
        }
    }
    


    
    func updateTimer()
    {
        counter -= 0.1

        progressBar.progress += 0.1/timePerQuestion
        
        timerLabel.text = "Timer: " + String(format: "%.1f", counter)
        let tempScoreLabelText = scoreLabel.text
        
        if counter <= 0.0
        {
            playTimeUpSound()
            timer.invalidate() //This pauses the timer
            counter = 0.0
            progressBar.progress = 1.0
            timerLabel.text = "Timer: " + String(format: "%.1f", counter)
            
            scoreLabel.text = replaceStringChar(forString: tempScoreLabelText!, atIndex: (7 + 2*(question.questionsAsked-1)), with: wrongMark)
            
            switch question.selectedQuestion["Cor Ans"]!
            {
            case "1": correctAnsLabel1.isHidden = false
            case "2": correctAnsLabel2.isHidden = false
            case "3": correctAnsLabel3.isHidden = false
            default: correctAnsLabel4.isHidden = false
            }
            
            ans1Button.alpha = 0.5
            ans2Button.alpha = 0.5
            ans3Button.alpha = 0.5
            ans4Button.alpha = 0.5
            
            ans1Button.isEnabled = false
            ans2Button.isEnabled = false
            ans3Button.isEnabled = false
            ans4Button.isEnabled = false
            

            //nextMoveButton.setTitle("Next Question", for: UIControlState()) //change later to variable
            
            if question.questionsAsked >= question.questionsPerRound
            {
                nextMoveButton.setTitle("", for: UIControlState()) //change later to variable
                nextMoveButton.alpha = 0.5

                let delay = Int64(NSEC_PER_SEC * UInt64(delaySeconds)) //seconds to wait
                // Calculates a time value to execute the method given current time and delay
                let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
                
                // Executes the nextRound method at the dispatch time on the main queue
                DispatchQueue.main.asyncAfter(deadline: dispatchTime)
                {
                    self.playEndGameSound()
                    self.questionField.isHidden = true
                    self.startScreenLabel1.text = "Way to go!\nYou got \(self.question.correctQuestions) out of \(self.question.questionsPerRound) correct.\n\n\nPress PLAY AGAIN below to play again"
                    self.startScreenLabel1.isHidden = false
                    self.timerLabel.isHidden = true
                    //self.scoreLabel.isHidden = true
                    
                    self.ans1Button.isHidden = true
                    self.ans2Button.isHidden = true
                    self.ans3Button.isHidden = true
                    self.ans4Button.isHidden = true
                    self.progressBar.isHidden = true
                    
                    self.correctAnsLabel1.isHidden = true
                    self.correctAnsLabel2.isHidden = true
                    self.correctAnsLabel3.isHidden = true
                    self.correctAnsLabel4.isHidden = true
                    
                    self.questionFrameLabel.isHidden = false
                    self.questionFrameLabel2.isHidden = true
                    
                    
                }
                
                let delay2 = Int64(NSEC_PER_SEC * UInt64(10)) //seconds to wait
                // Calculates a time value to execute the method given current time and delay
                let dispatchTime2 = DispatchTime.now() + Double(delay2) / Double(NSEC_PER_SEC)
                
                // Executes the nextRound method at the dispatch time on the main queue
                DispatchQueue.main.asyncAfter(deadline: dispatchTime2)
                {
                    self.nextMoveButton.isEnabled = true
                    self.nextMoveButton.setTitle("PLAY AGAIN", for: UIControlState()) //change later to variable
                    self.nextMoveButton.alpha = 1.0
                }
            } else
            {
                nextMoveButton.setTitle("Next Question", for: UIControlState()) //change later to variable
                nextMoveButton.isEnabled = true
                nextMoveButton.alpha = 1.0
            }
        }
    }
    
/*
    func nextRound()
    {
        if question.questionsAsked >= question.questionsPerRound
        {
            // Game is over
            //displayScore() //will bring this back
            print("This Game is Over")
        } else {
            // Continue game
            displayQuestion()
        }
    }
 */
    
    //
    
    func displayQuestion()
    {
        question.newDisplayQuestion()
        startScreenLabel1.isHidden = true
        
        questionNumberLabel.text = "Question \(question.questionsAsked)"
        nextMoveButton.setTitle(" ", for: UIControlState())
        questionNumberLabel.isHidden = false
        questionField.isHidden = false
        progressBar.isHidden = false
        scoreLabel.isHidden = false
        
        //Populate Question Field and Answer Fields with question information
        for (key, value) in question.selectedQuestion
        {
            switch key
            {
            case "Question": questionField.text = value
                print(value)
                print(" ")
            case "Ans 1": ans1Button.setTitle(value, for: UIControlState())
            case "Ans 2": ans2Button.setTitle(value, for: UIControlState())
            case "Ans 3": ans3Button.setTitle(value, for: UIControlState())
            case "Ans 4": ans4Button.setTitle(value, for: UIControlState())
            case "Cor Ans": corAnswer = value
            default: print("unknown option")
            }
        }
        //
        ansVerify.isHidden = true
        ansVerify2.isHidden = true
        ansVerify3.isHidden = true
        ansVerify4.isHidden = true
        
        ans1Button.isEnabled = true
        ans2Button.isEnabled = true
        ans3Button.isEnabled = true
        ans4Button.isEnabled = true
        
        ans1Button.alpha = 1.0
        ans2Button.alpha = 1.0
        ans3Button.alpha = 1.0
        ans4Button.alpha = 1.0
        
        correctAnsLabel1.isHidden = true
        correctAnsLabel2.isHidden = true
        correctAnsLabel3.isHidden = true
        correctAnsLabel4.isHidden = true
        
        questionFrameLabel.isHidden =  true
        questionFrameLabel2.isHidden = true
        
        //
       
        counter = Double(timePerQuestion)
        timerLabel.text = "Timer: \(counter)"
        progressBar.progress = 0.0
        timerLabel.isHidden = false
        
        ans1Button.isHidden = false
        ans2Button.isHidden = false
        ans3Button.isHidden = false
        ans4Button.isHidden = true
        
        if question.numberOfAnswerOptions == 4
        {
            questionFrameLabel.isHidden = false
            ans4Button.isHidden = false
            
        }else //number of question options = 3
        {
            questionFrameLabel2.isHidden = false
        }
        
        nextMoveButton.isHidden = false
        nextMoveButton.setTitle("", for: UIControlState())
        nextMoveButton.isEnabled = false
    
         //Start Timer
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
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
     */
    /*
    func loadGameStartSound() 
     {
        //GameSound
        //
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
 */
    
    func loadGameStartSound()
    {
        //GameSound
        //
        let pathToSoundFile = Bundle.main.path(forResource: "Pacman_Introduction_Music-KP-826387403", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func loadCorrectAnswerSound()
    {
        //GameSound
        //
        let pathToSoundFile = Bundle.main.path(forResource: "Metroid_Door-Brandino480-995195341", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctAnswerSound)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswerSound)
    }
    
    
    func loadWrongAnswerSound()
    {
        //GameSound
        //
        let pathToSoundFile = Bundle.main.path(forResource: "Alien Death Ray-SoundBible.com-1203224011", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &wrongAnswerSound)
    }
    
    func playWrongAnswerSound() {
        AudioServicesPlaySystemSound(wrongAnswerSound)
    }
    
    func loadEndGameSound()
    {
        //GameSound
        //
        let pathToSoundFile = Bundle.main.path(forResource: "Electrical_Sweep-Sweeper-1760111493", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &endGameSound)
    }
    
    func playEndGameSound() {
        AudioServicesPlaySystemSound(endGameSound)
    }
    
    func loadTimeUpSound()
    {
        //GameSound
        //
        let pathToSoundFile = Bundle.main.path(forResource: "Wrong Buzzer", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &timeUpSound)
    }
    
    func playTimeUpSound() {
        AudioServicesPlaySystemSound(timeUpSound)
    }

}

