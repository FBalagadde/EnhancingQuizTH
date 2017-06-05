//
//  QuestionManipulator.swift
//  TrueFalseStarter
//
//  Created by Frederick Balagadde on 6/5/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit

/// This Class handless methods and variables for all manipulations associated with a set of questions stored
/// in a dictionary this is stored in a structure:
/// (1) randomly selects a question that is stored in a variable:          selectedQuestion: [String: String],
/// (2) the number of correct answers:           correctQuestions: Int,
/// (3) the number of questions per round:       questionsPerRound: Int,
/// (4) # of answer options for current question:  numberOfAnswerOptions: Int,
/// (5) Function to increment # of correct answers:     func incrementCorrectAnswers(),
/// (6) Function to increment # of questions asked:     func incrementQuestionsAsked()
class QuestionManipulator
{
    var questionSet: TriviaQuestionSet      //Structure Object for question set
    var selectedQuestion: [String: String]  //Dictionary for selected question
    var correctQuestions: Int               //Number of correct answers
    var numberOfAnswerOptions: Int          //Number of answer options, 3 or 4will increment this later
    var questionsAsked: Int                 //Number of questions asked in a given round
    var questionsPerRound: Int              //Number of questions per round
    var selectedKeys: [Int]                 //array to hold selected numbers 1, 2,3 or 4
    var gameQuestions: [String]             //variable to contain strings of questions asked in a given round
    
    init(questionSet: TriviaQuestionSet)
    {
        self.questionSet = questionSet
        self.correctQuestions = 0
        self.selectedQuestion = [:]
        self.correctQuestions = 0
        self.numberOfAnswerOptions = 0
        self.questionsAsked = 0
        self.questionsPerRound = 4
        self.selectedKeys = []
        
        gameQuestions = [] //variable to contain strings of questions asked in a given round
    }
    
    /// Select a question form the dictionary with 4 or 3 answer options
    func newDisplayQuestion()
    {
        var indexOfSelectQuestion: Int = 0
        
        //Select a question that has not already been asked during this round
        repeat
        {
            indexOfSelectQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: questionSet.triviaQuestions.count)
            
            selectedQuestion = questionSet.triviaQuestions[indexOfSelectQuestion]
            
        } while gameQuestions.contains(selectedQuestion["Question"]!)
        
        gameQuestions.append(selectedQuestion["Question"]!) //include the question asked in the gameQuestions array
        
        //does the selected question have 3 or 4 answer options
        if selectedQuestion.count >= 6
        {
            numberOfAnswerOptions = 4
        }else
        {
            numberOfAnswerOptions = 3
        }
        
        /*
        // Starting with a 4-answer option question, below is an algorithm to
        // randomy make the selected question have 3 answer options or to
        // remain with 4 answer options
        
        let oddOrEvenRandomNUMber = (GKRandomSource.sharedRandom().nextInt(upperBound: 1000)) % 2   // Ransomly generate a 0 or a 1
        
        if oddOrEvenRandomNUMber == 0   //If the random number is a 0
        {
            numberOfAnswerOptions = 4
            
        }else   //The random number is a 1
        {
            numberOfAnswerOptions = 3
        }
        
        if numberOfAnswerOptions == 3   //If this should be a 3-answer option question
        {
            // If the correct answer option for the selected question is option 4, swap the correct option with one of the first 3 options selected at random
            if selectedQuestion["Cor Ans"] == "4"
            {
                //swap the correct answer with one of the 3 options
                let randomNumberFrom1To3 = ((GKRandomSource.sharedRandom().nextInt(upperBound: 1000))%3) + 1
                
                switch randomNumberFrom1To3
                {
                case 1:
                    selectedQuestion["Ans 1"] = selectedQuestion["Ans 4"]
                    selectedQuestion["Cor Ans"] = "1"
                case 2:
                    selectedQuestion["Ans 2"] = selectedQuestion["Ans 4"]
                    selectedQuestion["Cor Ans"] = "2"
                default: //case 3
                    selectedQuestion["Ans 3"] = selectedQuestion["Ans 4"]
                    selectedQuestion["Cor Ans"] = "3"
                }
            }
        }
        */
        questionsAsked += 1 //Increment the number of questions asked
    }
    
    /// Function to increment the number of correct answers
    func incrementCorrectAnswers()
    {
        correctQuestions += 1
    }
    
    /// Function to increment the number of questions asked
    func incrementQuestionsAsked()
    {
        questionsAsked += 1
    }
}
