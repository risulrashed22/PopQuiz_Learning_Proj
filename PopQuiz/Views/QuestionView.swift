//
//  QuestionView.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var gamePlay: GameManager
    var body: some View {
        VStack {
            HStack{
                Text("Pop Quiz")
                    .myTitle()
                Spacer()
                Text("\(gamePlay.index+1) out of \(gamePlay.length)")
                    .fontWeight(.heavy)
                    .foregroundColor(Color("AccentColor"))
            }
            .padding(.horizontal)
            ProgressBar(progress: gamePlay.progreesIs)
            VStack(alignment: .leading, spacing: 40) {
                Text(gamePlay.questionIs)
                    .font(.system(size: 20))
                    .bold()
                    //.foregroundColor(Color(""))
                
                
                ForEach(gamePlay.answerChoices, id: \.id){ ansser in
                    AnswerRow(answer: ansser)
                        .environmentObject(gamePlay)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 20)
            
            Button{
                gamePlay.goToNextQuestion()
            } label: {
                // Next Button
                PrimaryButton(buttonText: "Next", buttonColor: gamePlay.answerSelected ? Color("AccentColor") : .gray)
                    
            }
            .disabled(!gamePlay.answerSelected)
            
            Spacer()
        }
        .VStackPage()
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(GameManager())
    }
}
