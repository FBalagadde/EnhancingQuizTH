//
//  TriviaQuestionGenerator.swift
//  TrueFalseStarter
//
//  Created by Frederick Balagadde on 5/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

/// This Struct handless all issues related to questions:
/// (1) the original questions:                  triviaQuestions: [[String : String]],
/// (2) the randomly selected question:          selectedQuestion: [String: String],
/// (3) the number of correct answers:           correctQuestions: Int,
/// (4) the number of questions per round:       questionsPerRound: Int,
/// (5) # of answer options for current question:  numberOfAnswerOptions: Int,
/// (6) Function to increment # of correct answers:     func incrementCorrectAnswers(),
/// (7) Function to increment # of questions asked:     func incrementQuestionsAsked()
struct TriviaQuestionGenerator
{
    var selectedQuestion: [String: String] = [:] //Dictionary for selected question
    var correctQuestions: Int = 0   //Number of correct answers
    var numberOfAnswerOptions: Int = 0 //Number of answer options, 3 or 4will increment this later
    var questionsAsked: Int = 0
    var questionsPerRound: Int = 4
    var selectedKeys: [Int] = []    //array to hold selected numbers 1, 2,3 or 4
    
    //generat a random number from 0 to 9, Even => 4 questions, Odd=> 3 questions
    //var randomNum: Int = (GKRandomSource.sharedRandom().nextInt(upperBound: 9))
    
    var gameQuestions: [String] = [] //variable to contain strings of questions asked in a given round
    
    let triviaQuestions: [[String : String]] = [
        ["Question": "This was the only US President to serve more than two consecutive terms.",         "Ans 1": "George Washington",      "Ans 2": "Franklin D. Roosevelt", "Ans 3": "Woodrow Wilson",  "Ans 4": "Andrew Jackson",    "Cor Ans": "2"],
        ["Question": "Which of the following countries has the most residents?",                         "Ans 1": "Nigeria",                "Ans 2": "Russia",                "Ans 3": "Iran",            "Ans 4": "Vietnam",           "Cor Ans": "1"],
        ["Question": "In what year was the United Nations founded?",                                     "Ans 1": "1918",                   "Ans 2": "1919",                  "Ans 3": "1945",            "Ans 4": "1954",              "Cor Ans": "3"],
        ["Question": "The Titanic departed from the United Kingdom, where was it supposed to arrive?",   "Ans 1": "Paris",                  "Ans 2": "Washington D.C.",       "Ans 3": "New York City",   "Ans 4": "Boston",            "Cor Ans": "3"],
        ["Question": "Which nation produces the most oil?",                                              "Ans 1": "Iran",                   "Ans 2": "Iraq",                  "Ans 3": "Brazil",          "Ans 4": "Canada",            "Cor Ans": "4"],
        ["Question": "Which country has most recently won consecutive World Cups in Soccer?",            "Ans 1": "Italy",                  "Ans 2": "Brazil",                "Ans 3": "Argetina",        "Ans 4": "Spain",             "Cor Ans": "2"],
        ["Question": "Which of the following rivers is longest?",                                        "Ans 1": "Yangtze",                "Ans 2": "Mississippi",           "Ans 3": "Congo",           "Ans 4": "Mekong",            "Cor Ans": "2"],
        ["Question": "Which city is the oldest?",                                                        "Ans 1": "Mexico City",            "Ans 2": "Cape Town",             "Ans 3": "San Juan",        "Ans 4": "Sydney",            "Cor Ans": "1"],
        ["Question": "Which country was the first to allow women to vote in national elections?",        "Ans 1": "Poland",                 "Ans 2": "United States",         "Ans 3": "Sweden",          "Ans 4": "Senegal",           "Cor Ans": "1"],
        ["Question": "Which of these countries won the most medals in the 2012 Summer Games?",           "Ans 1": "France",                 "Ans 2": "Germany",               "Ans 3": "Japan",           "Ans 4": "Great Britian",     "Cor Ans": "4"],
        ["Question": "Where would you find the Sea of Tranquility?",                                     "Ans 1": "Japan",                  "Ans 2": "Australia",             "Ans 3": "The Moon",        "Ans 4": "Canada",            "Cor Ans": "3"],
        ["Question": "Name the seventh planet from the sun.",                                            "Ans 1": "Earth",                  "Ans 2": "Uranus",                "Ans 3": "Mars",            "Ans 4": "Jupiter",           "Cor Ans": "2"],
        ["Question": "Who invented the rabies vaccination?",                                             "Ans 1": "Louis Pasteur",          "Ans 2": "Albert Einstein",       "Ans 3": "Thomas Edison",   "Ans 4": "Alexander Fleming", "Cor Ans": "1"],
        ["Question": "Before the discovery of Mt. Everest, what was the highest mountain in the world?", "Ans 1": "K2",                     "Ans 2": "Mt. Kilimanjaro",       "Ans 3": "Mt. Vesuvius",    "Ans 4": "Mt. Everest",       "Cor Ans": "4"],
        ["Question": "What is the longest river in the world?",                                               "Ans 1": "Amazon",                 "Ans 2": "Nile",                  "Ans 3": "Mississippi",     "Ans 4": "Rhine",             "Cor Ans": "1"],
        ["Question": "Name the biggest island in the world?",                                                 "Ans 1": "New York City",          "Ans 2": "Australia",             "Ans 3": "Greenland",       "Ans 4": "Hawaii",            "Cor Ans": "3"],
        ["Question": "Who was the legendary Benedictine monk who invented champagne?",                   "Ans 1": "Benedict of Chardonnay", "Ans 2": "Dom Perignon",          "Ans 3": "Francis of Asisi","Ans 4": "Martin Luther",     "Cor Ans": "2"],
        ["Question": "What is the diameter of Earth?",                                                   "Ans 1": "10,000 miles",           "Ans 2": "8,000 miles",           "Ans 3": "60,000 miles",    "Ans 4": "100,000 miles",     "Cor Ans": "2"],
        ["Question": "What is the capitol City of New York City?",                                       "Ans 1": "New York City",          "Ans 2": "Philadelphia",          "Ans 3": "Baton Rouge",     "Ans 4": "Albany",            "Cor Ans": "4"],
        ["Question": "What kind of weapon is a falchion?",                                               "Ans 1": "A dagger",               "Ans 2": "A fighting stick",      "Ans 3": "A knife",         "Ans 4": "A sword",           "Cor Ans": "4"]]
    
    mutating func newDisplayQuestion()
    {
        var indexOfSelectQuestion: Int = 0
        //Select a question that has not already been asked during this round
        repeat
        {
            indexOfSelectQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: triviaQuestions.count)
            
            selectedQuestion = triviaQuestions[indexOfSelectQuestion]
            
        } while gameQuestions.contains(selectedQuestion["Question"]!)
        gameQuestions.append(selectedQuestion["Question"]!) //include the question asked in the gameQuestions array
        
        
        //Algorithm to randomy generate a question with 3 or 4 options
        //Randomly generate a 3 or a 4
        
        let oddOrEvenRandomNUMber = (GKRandomSource.sharedRandom().nextInt(upperBound: 1000)) % 2
        
        if oddOrEvenRandomNUMber == 0 {
            numberOfAnswerOptions = 4
        }else{
            numberOfAnswerOptions = 3
        }
        
        if numberOfAnswerOptions == 3   //If a 3 is generated
        {
            //The number of options for this question is 3
            
            //Reduce the number of options in the selected question from 4 to 3
            //1. Find the option that contains the answer
            //2. Select two of the incorrect options at random
            //3. Bundle the two incorrect options with the correct one to the original question
            //4. Modify teh answer option to accurately report the correct option
            
            var newSelectedQuestion: [String: String] = [:] //String dictionary to house the new 3-option question
            newSelectedQuestion["Question"] = selectedQuestion["Question"]! //insert Question key and value
            
            
            //Populate the question with 3 option answers. The correct answer must be one of them
            
            var randOptNum: Int = 0         //variable to hold random number created 1, 2, 3 or 4
            var conainsAns: Bool = false    //Does the question contain the correct answer as one of the options?
            
            for count in 1...3
            {
                //Generate a random number 1, 2, 3 or 4, and select it if it has not already been selected
                repeat
                {
                    randOptNum = (GKRandomSource.sharedRandom().nextInt(upperBound: 1000)%4) + 1 //random num: 1, 2, 3 or 4
                } while selectedKeys.contains(randOptNum)
                selectedKeys.append(randOptNum)
               
                
                switch count
                {
                //If the new question contain 2 answer options and none of them is the right one,
                //then force the third option to be the right option
                case 3:
                    for (_, value) in newSelectedQuestion
                    {
                        //If one of the values in the new question dictionary is the correct answer
                        if value == selectedQuestion["Ans \(selectedQuestion["Cor Ans"]!)"]
                        {
                            conainsAns = true
                        }
                    }
                    
                    if !conainsAns
                    {
                        //let correctAnsString: String =
                        newSelectedQuestion["Ans \(count)"] = selectedQuestion["Ans " + selectedQuestion["Cor Ans"]!]!
                        newSelectedQuestion["Cor Ans"] = "\(count)"
                    } else
                    {
                        newSelectedQuestion["Ans \(count)"] = selectedQuestion["Ans \(randOptNum)"]!
                    }
                    
                default:
                    newSelectedQuestion["Ans \(count)"] = selectedQuestion["Ans \(randOptNum)"]!
                    if selectedQuestion["Cor Ans"]! == "\(randOptNum)" //if this is the right answer
                    {
                        newSelectedQuestion["Cor Ans"] = "\(count)"
                    }
                }
            }
            selectedQuestion = newSelectedQuestion
        }
        questionsAsked += 1
    }
    
    /// Function to increment the number of correct answers
    mutating func incrementCorrectAnswers()
    {
        correctQuestions += 1
    }
    
    /// Function to increment the number of questions asked
    mutating func incrementQuestionsAsked()
    {
         questionsAsked += 1
    }
}











































