//
//  GameManager.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import Foundation
import SwiftUI

class GameManager: ObservableObject{
    private(set) var gameData: [GameData.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0  // Question number
    @Published private(set) var reachedEnd = false // did the user reached at the end of the game
    @Published private(set) var answerSelected = false
    @Published private(set) var questionIs: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progreesIs: CGFloat = 0
    @Published private(set) var scores: Int = 0
    
    init(){
        Task.init {
            await fetchGameData()
        }
    }
    
    func fetchGameData() async{
        guard let gameUrl = URL(string: "https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple") else{
            fatalError("Missing URL")
        }
        let urlRequest = URLRequest(url: gameUrl)
        do {
            let (myData, resopse) = try await URLSession.shared.data(for: urlRequest)
            guard (resopse as? HTTPURLResponse)?.statusCode == 200 else{
                fatalError("Error while fetching data")
            }
            // after passing the guard statement
            let mydecoder = JSONDecoder()
            mydecoder.keyDecodingStrategy = .convertFromSnakeCase // This will convert key of "some_data" to "someData"
                                                                  // to match our key variable
            let decodedData = try mydecoder.decode(GameData.self, from: myData)
            
            DispatchQueue.main.async {
                self.gameData = decodedData.results
                self.length = self.gameData.count
                self.setQuestion()
            }
            
        } catch {
            print("URL request Error: \(error)")
        }
    }
    
    func goToNextQuestion(){
        if index+1 < length{
            index += 1
            setQuestion()
        }
        else{
            reachedEnd = true
        }
    }
    func setQuestion(){
        answerSelected = false
        progreesIs = CGFloat((index+1) / length * 400)
        
        // next question
        if index < length{
            let currentQuestion = gameData[index]
            questionIs = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answers
        }
    }
    func selectedAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect{
            scores += 1
        }
    }
}
