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
    
    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]
    
    
    var question: TriviaQuestionGenerator = TriviaQuestionGenerator()
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
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var ansVerify: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var quizStatusLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
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
        nextMoveButton.isHidden = true
        nextMoveButton.setTitle("", for: UIControlState())
        quizStatusLabel.isHidden = true
        
        let cornerRadius: CGFloat = 10 //will move
        ans1Button.layer.cornerRadius = cornerRadius
        ans2Button.layer.cornerRadius = cornerRadius
        ans3Button.layer.cornerRadius = cornerRadius
        ans4Button.layer.cornerRadius = cornerRadius
        nextMoveButton.layer.cornerRadius = cornerRadius
        questionFrame.layer.cornerRadius = cornerRadius
        answersFrame.layer.cornerRadius = cornerRadius
        ansVerify.layer.cornerRadius = cornerRadius
        scoreLabel.layer.cornerRadius = cornerRadius
        timerLabel.text = "15.0"
        progressBar.progress = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    @IBAction func checkAnswer(_ sender: UIButton)
    {
        switch sender
        {
        case ans1Button:
            if question.selectedQuestion["Cor Ans"] == "1" {
                ansVerify.text = "Correct!" //convert into array
                question.incrementCorrectAnswers()
            } else {
                ansVerify.text = "Sorry, that's not it" //convert into array
            }
          
         
            ans2Button.alpha = 0.5
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
            
            quizStatusLabel.text = "You have completed \(question.questionsAsked)/\(question.questionsPerRound) questions"
            quizStatusLabel.isHidden = false
            
            timer.invalidate() //This pauses the timer
            timerLabel.text = String(format: "%.1f", counter)
            
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
            
            quizStatusLabel.text = "You have completed \(question.questionsAsked)/\(question.questionsPerRound) questions"
            quizStatusLabel.isHidden = false
            
            timer.invalidate() //This pauses the timer
            timerLabel.text = String(format: "%.1f", counter)
            
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
            
            quizStatusLabel.text = "You have completed \(question.questionsAsked)/\(question.questionsPerRound) questions"
            quizStatusLabel.isHidden = false
            
            timer.invalidate() //This pauses the timer
            timerLabel.text = String(format: "%.1f", counter)
            
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
            
            quizStatusLabel.text = "You have completed \(question.questionsAsked)/\(question.questionsPerRound) questions"
            quizStatusLabel.isHidden = false
            
            timer.invalidate() //This pauses the timer
            timerLabel.text = String(format: "%.1f", counter)
            
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

           
        default: ansVerify.text = "Indeterminate" //convert into array

            
        }
        
        
        scoreLabel.text = "Score: \(question.correctQuestions)"
        
        scoreLabel.isHidden = false
        
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
    }
    
    func updateTimer()
    {
        counter -= 0.1
        progressBar.progress += 0.1/15.0
        
        timerLabel.text = String(format: "%.1f", counter)
        
        
        
        if counter <= 0.0
        {
            
            timer.invalidate() //This pauses the timer
            counter = 0.0
            progressBar.progress = 1.0
            timerLabel.text = String(format: "%.1f", counter)
            ansVerify.text = "Sorry, Time is up!" //convert into array
            
            ans1Button.alpha = 0.5
            ans2Button.alpha = 0.5
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
            scoreLabel.text = "Score: \(question.correctQuestions)"
            scoreLabel.isHidden = false
            
            quizStatusLabel.text = "You have completed \(question.questionsAsked)/\(question.questionsPerRound) questions"
            quizStatusLabel.isHidden = false
            
            
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
    
    func displayQuestion()
    {
        //nextMoveButton.isHidden = true
        nextMoveButton.isEnabled = false
        nextMoveButton.setTitle("", for: UIControlState()) //change later to variable
        nextMoveButton.alpha = 0.5
        ansVerify.isHidden =  true
        
        ans1Button.setTitle("", for: UIControlState())
        ans2Button.setTitle("", for: UIControlState())
        ans3Button.setTitle("", for: UIControlState())
        ans4Button.setTitle("", for: UIControlState())
        
        ans1Button.alpha = 1
        ans2Button.alpha = 1
        ans3Button.alpha = 1
        ans4Button.alpha = 1
        
        //Populate Question Field and Answer Fields with question information
        question.newDisplayQuestion()
        
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
        
        questionNumberLabel.text = "Question \(question.questionsAsked + 1):"
        
        
        counter = 15.0
        timerLabel.text = "\(counter)"
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        
        
        //scoreLabel.isHidden = true
        //nextMoveButton.isHidden = true
        
        question.incrementQuestionsAsked()
       
        /*
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
 */
        

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

