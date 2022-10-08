//
//  GameData.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import Foundation

struct GameData: Decodable{
    var results: [Result]
    
    struct Result: Identifiable, Decodable{
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString{
            do{
                return try AttributedString(markdown: question)
            }
            catch{
                print("Question Couldn't be converted error: \(error)")
                return ""
            }
        }
        
        var answers: [Answer]{
            do{
                let correctA = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrectA = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswer = correctA + incorrectA
                return allAnswer.shuffled() // so the elements in array is randomized
            }
            catch{
                print("Answer Couldn't be converted error: \(error)")
                return []
            }
        }
    }
}
