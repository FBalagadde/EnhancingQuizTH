//
//  TriviaQuestionGenerator.swift
//  TrueFalseStarter
//
//  Created by Frederick Balagadde on 5/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

struct TriviaQuestionGenerator
{
    //var indexOfSelectQuestion: Int = 0;
    
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
        ["Question": "What is the world's longest river?",                                               "Ans 1": "Amazon",                 "Ans 2": "Nile",                  "Ans 3": "Mississippi",     "Ans 4": "Rhine",             "Cor Ans": "1"],
        ["Question": "Name the world's biggest island?",                                                 "Ans 1": "New York City",          "Ans 2": "Australia",             "Ans 3": "Greenland",       "Ans 4": "Hawaii",            "Cor Ans": "3"],
        ["Question": "Who was the legendary Benedictine monk who invented champagne?",                   "Ans 1": "Benedict of Chardonnay", "Ans 2": "Dom Perignon",          "Ans 3": "Francis of Asisi","Ans 4": "Martin Luther",     "Cor Ans": "2"],
        ["Question": "What is the diameter of Earth?",                                                   "Ans 1": "10,000 miles",           "Ans 2": "8,000 miles",           "Ans 3": "60,000 miles",    "Ans 4": "100,000 miles",     "Cor Ans": "2"],
        ["Question": "What is the capitol City of New York City?",                                       "Ans 1": "New York City",          "Ans 2": "Philadelphia",          "Ans 3": "Baton Rouge",     "Ans 4": "Albany",            "Cor Ans": "4"],
        ["Question": "What kind of weapon is a falchion?",                                               "Ans 1": "A dagger",               "Ans 2": "A fighting stick",      "Ans 3": "A knife",         "Ans 4": "A sword",           "Cor Ans": "1"]]
    
    func newDisplayQuestion() -> [String]
    {
        let indexOfSelectQuestion: Int = GKRandomSource.sharedRandom().nextInt(upperBound: triviaQuestions.count)
        let questionDictionary = triviaQuestions[indexOfSelectQuestion]
        var questionArray: [String] = []
        
        
        return questionArray
    }
    
}

let triviaQuestionGenerator: TriviaQuestionGenerator = TriviaQuestionGenerator()

let triviaQuest = triviaQuestionGenerator.triviaQuestions[1]
