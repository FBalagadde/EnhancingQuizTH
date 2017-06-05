//
//  TriviaQuestionGenerator.swift
//  TrueFalseStarter
//
//  Created by Frederick Balagadde on 5/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

/// This Struct stores the question set for the quiz in a dictionary data structure.
struct TriviaQuestionSet
{
    let triviaQuestions: [[String : String]] = [
        ["Question": "This was the only US President to serve more than two consecutive terms.",         "Ans 1": "George Washington",      "Ans 2": "Franklin D. Roosevelt", "Ans 3": "Woodrow Wilson",  "Ans 4": "Andrew Jackson",    "Cor Ans": "2"],
        ["Question": "What do you call a time span of one thousand years?",                              "Ans 1": "Millennium",             "Ans 2": "Century",               "Ans 3": "Eon",             "Cor Ans": "1"],
        ["Question": "When did the world celebrate its most recent millennium?",                         "Ans 1": "Year 1999",              "Ans 2": "Year 2000",             "Ans 3": "Year 0",          "Cor Ans": "2"],
        ["Question": "Which of the following countries has the most residents?",                         "Ans 1": "Nigeria",                "Ans 2": "Russia",                "Ans 3": "Iran",            "Ans 4": "Vietnam",           "Cor Ans": "1"],
        ["Question": "How many points does a compass have?",                                             "Ans 1": "32",                     "Ans 2": "4",                     "Ans 3": "8",               "Cor Ans": "1"],
        ["Question": "In what year was the United Nations founded?",                                     "Ans 1": "1918",                   "Ans 2": "1919",                  "Ans 3": "1945",            "Ans 4": "1954",              "Cor Ans": "3"],
        ["Question": "The Titanic departed from the United Kingdom, where was it supposed to arrive?",   "Ans 1": "Paris",                  "Ans 2": "Washington D.C.",       "Ans 3": "New York City",   "Ans 4": "Boston",            "Cor Ans": "3"],
        ["Question": "Which nation produces the most oil?",                                              "Ans 1": "Iran",                   "Ans 2": "Iraq",                  "Ans 3": "Brazil",          "Ans 4": "Canada",            "Cor Ans": "4"],
        ["Question": "What did Sir Christopher Cockerell invent?",                                       "Ans 1": "Steam Engine",           "Ans 2": "Segue",                 "Ans 3": "Hovercraft",      "Cor Ans": "3"],
        ["Question": "Who wrote a series of novels about orcs, hobbits, goblins and elves?",             "Ans 1": "Charles Dickens",        "Ans 2": "JR Tolkien",            "Ans 3": "Stephen King",    "Cor Ans": "2"],
        ["Question": "What do you call the smell which wine gives off?",                                 "Ans 1": "Aroma",                  "Ans 2": "Perfume",               "Ans 3": "Bouquet",         "Cor Ans": "3"],
        ["Question": "Which country has most recently won consecutive World Cups in Soccer?",            "Ans 1": "Italy",                  "Ans 2": "Brazil",                "Ans 3": "Argetina",        "Ans 4": "Spain",             "Cor Ans": "2"],
        ["Question": "What was John Wayne's original name?",                                             "Ans 1": "Clark Gable",            "Ans 2": "Marion Morrison",       "Ans 3": "Humphrey Bogart", "Cor Ans": "2"],
        ["Question": "Which of the following rivers is longest?",                                        "Ans 1": "Yangtze",                "Ans 2": "Mississippi",           "Ans 3": "Congo",           "Ans 4": "Mekong",            "Cor Ans": "2"],
        ["Question": "Whose statue in Red Square was pulled down in 1991?",                              "Ans 1": "Lenin",                  "Ans 2": "Stalin",                "Ans 3": "Krushchev",       "Cor Ans": "1"],
        ["Question": "Which city is the oldest?",                                                        "Ans 1": "Mexico City",            "Ans 2": "Cape Town",             "Ans 3": "San Juan",        "Ans 4": "Sydney",            "Cor Ans": "1"],
        ["Question": "Which country was the first to allow women to vote in national elections?",        "Ans 1": "Poland",                 "Ans 2": "United States",         "Ans 3": "Sweden",          "Ans 4": "Senegal",           "Cor Ans": "1"],
        ["Question": "How many strings does a cello have?",                                              "Ans 1": "6",                      "Ans 2": "12",                    "Ans 3": "4",               "Cor Ans": "3"],
        ["Question": "In which year did Britain start using the decimal currency?",                      "Ans 1": "1971",                   "Ans 2": "1776",                  "Ans 3": "1945",            "Cor Ans": "1"],
        ["Question": "What is the average temperature of the human body, in degrees centigrade?",        "Ans 1": "98.4",                   "Ans 2": "37",                    "Ans 3": "100",             "Cor Ans": "2"],
        ["Question": "Which former American president had a popular children's toy named after him?",    "Ans 1": "Theodore Roosevelt",     "Ans 2": "John F Kennedy",        "Ans 3": "George Washington","Cor Ans": "1"],
        ["Question": "What is rum distilled from?",                                                      "Ans 1": "Barley",                 "Ans 2": "Rye",                   "Ans 3": "Sugar cane",      "Cor Ans": "3"],
        ["Question": "Which of these countries won the most medals in the 2012 Summer Games?",           "Ans 1": "France",                 "Ans 2": "Germany",               "Ans 3": "Japan",           "Ans 4": "Great Britian",     "Cor Ans": "4"],
        ["Question": "Where would you find the Sea of Tranquility?",                                     "Ans 1": "Japan",                  "Ans 2": "Australia",             "Ans 3": "The Moon",        "Ans 4": "Canada",            "Cor Ans": "3"],
        ["Question": "Who invented the jet engine?",                                                     "Ans 1": "Frank Whittle",          "Ans 2": "Thomas Edison",         "Ans 3": "Nicola Tesla",    "Cor Ans": "1"],
        ["Question": "Name the seventh planet from the sun.",                                            "Ans 1": "Earth",                  "Ans 2": "Uranus",                "Ans 3": "Mars",            "Ans 4": "Jupiter",           "Cor Ans": "2"],
        ["Question": "Who invented the rabies vaccination?",                                             "Ans 1": "Louis Pasteur",          "Ans 2": "Albert Einstein",       "Ans 3": "Thomas Edison",   "Ans 4": "Alexander Fleming", "Cor Ans": "1"],
        ["Question": "How many symphonies did Beethoven compose?",                                       "Ans 1": "9",                      "Ans 2": "23",                    "Ans 3": "127",             "Cor Ans": "1"],
        ["Question": "Before the discovery of Mt. Everest, what was the highest mountain in the world?", "Ans 1": "K2",                     "Ans 2": "Mt. Kilimanjaro",       "Ans 3": "Mt. Vesuvius",    "Ans 4": "Mt. Everest",       "Cor Ans": "4"],
        ["Question": "What is the longest river in the world?",                                          "Ans 1": "Amazon",                 "Ans 2": "Nile",                  "Ans 3": "Mississippi",     "Ans 4": "Rhine",             "Cor Ans": "1"],
        ["Question": "Name the biggest island in the world?",                                            "Ans 1": "Long Island",            "Ans 2": "Australia",             "Ans 3": "Greenland",       "Ans 4": "Hawaii",            "Cor Ans": "3"],
        ["Question": "Who was the legendary Benedictine monk who invented champagne?",                   "Ans 1": "Benedict of Chardonnay", "Ans 2": "Dom Perignon",          "Ans 3": "Francis of Asisi","Ans 4": "Martin Luther",     "Cor Ans": "2"],
        ["Question": "Which two numbers are used in binary code?",                                       "Ans 1": "1 and 2",                "Ans 2": "0 and 1",               "Ans 3": "5 and 10",        "Cor Ans": "2"],
        ["Question": "What is the diameter of Earth?",                                                   "Ans 1": "10,000 miles",           "Ans 2": "8,000 miles",           "Ans 3": "60,000 miles",    "Ans 4": "100,000 miles",     "Cor Ans": "2"],
        ["Question": "What medicine approach uses needles inserted into the body at specific points?",   "Ans 1": "Qigong",                 "Ans 2": "Acupuncture",           "Ans 3": "Tui na",          "Cor Ans": "2"],
        ["Question": "What is the capitol City of New York City?",                                       "Ans 1": "New York City",          "Ans 2": "Philadelphia",          "Ans 3": "Baton Rouge",     "Ans 4": "Albany",            "Cor Ans": "4"],
        ["Question": "What was Che Guevara's nationality?",                                              "Ans 1": "American",               "Ans 2": "Mexican",               "Ans 3": "Argentinian",     "Cor Ans": "3"],
        ["Question": "Which British coin was also known as a bob?",                                      "Ans 1": "Shilling",               "Ans 2": "Penny",                 "Ans 3": "Nickel",          "Cor Ans": "1"],
        ["Question": "What kind of weapon is a falchion?",                                               "Ans 1": "A dagger",               "Ans 2": "A fighting stick",      "Ans 3": "A knife",         "Ans 4": "A sword",           "Cor Ans": "4"]]
    
} // End struct TriviaQuestionGenerator











































