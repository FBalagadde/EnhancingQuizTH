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
    var correctQuestions = 0 //put in results object
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0
    
    var delaySeconds: Int = 10 //delay in questions
    
    var correctMark: String = "✔︎"
    var wrongMark: String = "✘"
    var emptyMark: String = "☐"
    
    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]
    
    
    var question: TriviaQuestionGenerator = TriviaQuestionGenerator() //move this to the initialization section
    var timer = Timer()
    var counter: Double = 15.0
    
    var isRunning: Bool = false
    
    @IBOutlet weak var ans1Button: UIButton!
    @IBOutlet weak var ans2Button: UIButton!
    @IBOutlet weak var ans3Button: UIButton!
    @IBOutlet weak var ans4Button: UIButton!
    @IBOutlet weak var nextMoveButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    //@IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var gameTitle: UILabel!
   
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var ansVerify: UILabel!
    @IBOutlet weak var ansVerify2: UILabel!
    @IBOutlet weak var ansVerify3: UILabel!
    @IBOutlet weak var ansVerify4: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    //@IBOutlet weak var quizStatusLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
   
   
    @IBOutlet weak var questionFrameLabel: UILabel!
    @IBOutlet weak var questionFrameLabel2: UILabel!
    
    var corAnswer: String = ""

    
    @IBOutlet weak var correctAnsLabel1: UILabel!
    @IBOutlet weak var correctAnsLabel2: UILabel!
    @IBOutlet weak var correctAnsLabel3: UILabel!
    @IBOutlet weak var correctAnsLabel4: UILabel!
    
    @IBOutlet weak var correctAnsTickLabel1: UILabel!
    @IBOutlet weak var correctAnsTickLabel2: UILabel!
    @IBOutlet weak var correctAnsTickLabel3: UILabel!
    @IBOutlet weak var correctAnsTickLabel4: UILabel!

    
    @IBOutlet weak var playAgainButton: UIButton! //consider deleting
    
    
    //New variables
    var ScreenWidth: CGFloat = 0.0
    var ScreenHeight: CGFloat = 0.0
    
    
    
    //New Variables
    


    override func viewDidLoad() {
        super.viewDidLoad()
        //New Code
        //var screenSize: CGRect = UIScreen.
        
        //New Code
        

        initializeApp()
        displayQuestion()
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
        correctAnsLabel1.layer.borderColor = UIColor.white.cgColor
        
        ans2Button.isHidden = true
        ans2Button.layer.cornerRadius = cornerRadius
        ans2Button.isEnabled = false
        
        correctAnsLabel2.isHidden = true
        correctAnsLabel2.layer.cornerRadius = cornerRadius
        correctAnsLabel2.layer.borderWidth = borderWidth
        correctAnsLabel2.layer.borderColor = UIColor.white.cgColor
        
        ans3Button.isHidden = true
        ans3Button.layer.cornerRadius = cornerRadius
        ans3Button.isEnabled = false
        
        correctAnsLabel3.isHidden = true
        correctAnsLabel3.layer.cornerRadius = cornerRadius
        correctAnsLabel3.layer.borderWidth = borderWidth
        correctAnsLabel3.layer.borderColor = UIColor.white.cgColor
        
        correctAnsTickLabel1.isHidden = true
        correctAnsTickLabel2.isHidden = true
        correctAnsTickLabel3.isHidden = true
        correctAnsTickLabel4.isHidden = true
        
        ans4Button.isHidden = true
        ans4Button.layer.cornerRadius = cornerRadius
        ans4Button.isEnabled = false
        
        correctAnsLabel4.isHidden = true
        correctAnsLabel4.layer.cornerRadius = cornerRadius
        correctAnsLabel4.layer.borderWidth = borderWidth
        correctAnsLabel4.layer.borderColor = UIColor.white.cgColor
        
        ansVerify.isHidden = true
        ansVerify2.isHidden = true
        ansVerify3.isHidden = true
        ansVerify4.isHidden = true
        
        timerLabel.text = "Timer: 15.0"
        timerLabel.isHidden = true
        
        scoreLabel.isHidden = true
        scoreLabel.text = emptyMark + " " + emptyMark + " " + emptyMark + " " + emptyMark
        
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
    
 
   
    
    @IBAction func checkAnswer(_ sender: UIButton)
    {
        let tempScoreLabelText: String = scoreLabel.text!
        
        switch sender
        {
        case ans1Button:
            
            if question.selectedQuestion["Cor Ans"] == "1" {
                ansVerify.text = correctMark
                question.incrementCorrectAnswers()
                scoreLabel.text = replaceStringChar(forString: tempScoreLabelText, atIndex: 2*(question.questionsAsked-1), with: correctMark)
            } else {
                ansVerify.text = wrongMark
                scoreLabel.text = replaceStringChar(forString: tempScoreLabelText, atIndex: 2*(question.questionsAsked-1), with: wrongMark)
                
                switch question.selectedQuestion["Cor Ans"]!
                {
                    case "1": correctAnsLabel1.isHidden = false
                        correctAnsTickLabel1.isHidden = false
                    case "2": correctAnsLabel2.isHidden = false
                        correctAnsTickLabel2.isHidden = false
                    case "3": correctAnsLabel3.isHidden = false
                        correctAnsTickLabel3.isHidden = false
                    default: correctAnsLabel4.isHidden = false
                        correctAnsTickLabel4.isHidden = false
                }
            }
            ansVerify.isHidden = false
            scoreLabel.isHidden = false
          
         
            ans2Button.alpha = 0.5
            ans3Button.alpha = 0.5
            ans4Button.alpha = 0.5
            
            ans1Button.isEnabled = false
            ans2Button.isEnabled = false
            ans3Button.isEnabled = false
            ans4Button.isEnabled = false
            
            nextMoveButton.isEnabled = true
            nextMoveButton.alpha = 1.0
            
            if question.questionsAsked >= question.questionsPerRound
            {
                nextMoveButton.setTitle("Play Again", for: UIControlState()) //change later to variable
            } else {
                nextMoveButton.setTitle("Next Question", for: UIControlState()) //change later to variable
            }
            
            timer.invalidate() //This pauses the timer
            timerLabel.text = "Timer: " + String(format: "%.1f", counter)
            
        case ans2Button:
            if question.selectedQuestion["Cor Ans"] == "2" {
                ansVerify.text = "Correct!" //convert into array
                question.incrementCorrectAnswers()
            } else {
                ansVerify.text = "Sorry, that's not it" //convert into array
            }
         
            ans1Button.alpha = 0.5
            ans3Button.alpha = 0.5
            ans4Button.alpha = 0.5
            
            ans1Button.isEnabled = false
            ans2Button.isEnabled = false
            ans3Button.isEnabled = false
            ans4Button.isEnabled = false
            
            nextMoveButton.isEnabled = true
            nextMoveButton.isHidden = false
            nextMoveButton.alpha = 1.0
            nextMoveButton.setTitle("Next Question", for: UIControlState()) //change later to variable
            ansVerify.isHidden =  false
            
            //quizStatusLabel.text = "You have completed \(question.questionsAsked)/\(question.questionsPerRound) questions"
            //quizStatusLabel.isHidden = false
            
            timer.invalidate() //This pauses the timer
            timerLabel.text = "Timer: " + String(format: "%.1f", counter)
            
        case ans3Button:
            if question.selectedQuestion["Cor Ans"] == "3" {
                ansVerify.text = "Correct!" //convert into array
                question.incrementCorrectAnswers()
            } else {
                ansVerify.text = "Sorry, that's not it" //convert into array
            }
       
            ans1Button.alpha = 0.5
            ans2Button.alpha = 0.5
            ans4Button.alpha = 0.5
            
            ans1Button.isEnabled = false
            ans2Button.isEnabled = false
            ans3Button.isEnabled = false
            ans4Button.isEnabled = false
            
            nextMoveButton.isEnabled = true
            nextMoveButton.isHidden = false
            nextMoveButton.alpha = 1.0
            nextMoveButton.setTitle("Next Question", for: UIControlState()) //change later to variable
            ansVerify.isHidden =  false
            
           // quizStatusLabel.text = "You have completed \(question.questionsAsked)/\(question.questionsPerRound) questions"
            //quizStatusLabel.isHidden = false
            
            timer.invalidate() //This pauses the timer
            timerLabel.text = "Timer: " + String(format: "%.1f", counter)
            
        case ans4Button:
            if question.selectedQuestion["Cor Ans"] == "4" {
                ansVerify.text = "Correct!" //convert into array
                question.incrementCorrectAnswers()
            } else {
                ansVerify.text = "Sorry, that's not it" //convert into array
            }
 
            ans1Button.alpha = 0.5
            ans2Button.alpha = 0.5
            ans3Button.alpha = 0.5
            
            ans1Button.isEnabled = false
            ans2Button.isEnabled = false
            ans3Button.isEnabled = false
            ans4Button.isEnabled = false
            
            nextMoveButton.isEnabled = true
            nextMoveButton.isHidden = false
            nextMoveButton.alpha = 1.0
            nextMoveButton.setTitle("Next Question", for: UIControlState()) //change later to variable
            ansVerify.isHidden =  false
            
            //quizStatusLabel.text = "You have completed \(question.questionsAsked)/\(question.questionsPerRound) questions"
            //quizStatusLabel.isHidden = false
            
            timer.invalidate() //This pauses the timer
            timerLabel.text = "Timer: " + String(format: "%.1f", counter)
         
            /*
        case nextMoveButton:
            if question.questionsAsked < question.questionsPerRound
            {
                //loadNextRoundWithDelay(seconds: 5) //will change this to variable
                 displayQuestion()
            }else {
                //nextbutton = play again
                //display final score
            }
            nextMoveButton.isEnabled = false
            //nextMoveButton.isHidden = true
            nextMoveButton.setTitle("", for: UIControlState()) //change later to variable
            nextMoveButton.alpha = 0.5
*/
           
        default: ansVerify.text = "Indeterminate" //convert into array

            
        }
        

        
        //ans1Button.setTitle(value, for: UIControlState())
        //nextMoveButton.setTitle("Next Question", for: UIControlState()) //put next question in String
        
        //change button color appropriately
        //nextMoveButton.isHidden = false
        
        
        
        /*
        let delay2 = Int64(NSEC_PER_SEC * UInt64(3)) //will change th input to a variable
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime2 = DispatchTime.now() + Double(delay2) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime2) {
         
        
        self.scoreLabel.text = "Score: \(self.randomlySelectedQuestion.correctQuestions)/\(self.randomlySelectedQuestion.questionsAsked)"
        self.scoreLabel.isHidden = false
        
        //ans1Button.setTitle(value, for: UIControlState())
        self.nextMoveButton.setTitle("Next Question", for: UIControlState()) //put next question in String
        //change button color appropriately
        self.nextMoveButton.isHidden = false
        
        self.quizStatusLabel.text = "You have completed \(self.randomlySelectedQuestion.questionsAsked)/\(self.randomlySelectedQuestion.questionsPerRound) questions"
        self.quizStatusLabel.isHidden = false
        }
 */
        

        
    /*
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
        
        //loadNextRoundWithDelay(seconds: 2)
 */
    } // end @IBAction func checkAnswer
    

    
    func updateTimer()
    {
        counter -= 0.1
        progressBar.progress += 0.1/15.0
        
        timerLabel.text = "Timer: " + String(format: "%.1f", counter)
        let tempScoreLabelText = scoreLabel.text
        
        
        if counter <= 0.0
        {
            
            timer.invalidate() //This pauses the timer
            counter = 0.0
            progressBar.progress = 1.0
            timerLabel.text = "Timer: " + String(format: "%.1f", counter)
            

            scoreLabel.text = replaceStringChar(forString: tempScoreLabelText!, atIndex: 2*(question.questionsAsked-1), with: wrongMark)
            
            switch question.selectedQuestion["Cor Ans"]!
            {
            case "1": correctAnsLabel1.isHidden = false
                correctAnsTickLabel1.isHidden = false
            case "2": correctAnsLabel2.isHidden = false
                correctAnsTickLabel2.isHidden = false
            case "3": correctAnsLabel3.isHidden = false
                correctAnsTickLabel3.isHidden = false
            default: correctAnsLabel4.isHidden = false
                correctAnsTickLabel4.isHidden = false
            }
            
            ans1Button.alpha = 0.5
            ans2Button.alpha = 0.5
            ans3Button.alpha = 0.5
            ans4Button.alpha = 0.5
            
            ans1Button.isEnabled = false
            ans2Button.isEnabled = false
            ans3Button.isEnabled = false
            ans4Button.isEnabled = false
            
            nextMoveButton.isEnabled = true
            nextMoveButton.alpha = 1.0
            nextMoveButton.setTitle("Next Question", for: UIControlState()) //change later to variable

            
            //quizStatusLabel.text = "You have completed \(question.questionsAsked)/\(question.questionsPerRound) questions"
            //quizStatusLabel.isHidden = false
            
            
        }
        
    }
    
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
    
    
    func nextRound()
    {
        if question.numberOfAnswerOptions >= question.questionsPerRound
        {
            // Game is over
            //displayScore()
            print("This Game is Over")
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    //
    
    func displayQuestion()
    {
        question.newDisplayQuestion()
        print(question.selectedQuestion)
        print(question.selectedQuestion.count)
        print(question.numberOfAnswerOptions)
        
      
        
        questionField.text = "Question \(question.questionsAsked)"
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
            case "Ans 1": ans1Button.setTitle(value, for: UIControlState())
            case "Ans 2": ans2Button.setTitle(value, for: UIControlState())
            case "Ans 3": ans3Button.setTitle(value, for: UIControlState())
            case "Ans 4": ans4Button.setTitle(value, for: UIControlState())
            case "Cor Ans": corAnswer = value
            default: print("unknown option")
            }
        }
        ans1Button.isEnabled = true
        ans2Button.isEnabled = true
        ans3Button.isEnabled = true
        ans4Button.isEnabled = true
        
       
        counter = 15.0
        timerLabel.text = "Timer: \(counter)"
        progressBar.progress = 0.0
        timerLabel.isHidden = false
        
        ans1Button.isHidden = false
        ans2Button.isHidden = false
        ans3Button.isHidden = false
        
        if question.numberOfAnswerOptions == 4
        {
            questionFrameLabel.isHidden = false
            ans4Button.isHidden = false
            
        }else //number of question options = 3
        {
            questionFrameLabel2.isHidden = false
        }
        
        nextMoveButton.isHidden = false
    
        
        
         //Start Timer
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        

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

