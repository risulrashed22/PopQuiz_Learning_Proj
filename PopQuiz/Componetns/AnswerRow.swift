//
//  AnswerRow.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var gamePlay: GameManager
    var answer: Answer
    var correctColor: Color = .green
    var wrongColor: Color = .red
    @State var selected = false
    var body: some View {
        HStack(spacing: 20) {
            if selected{
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? correctColor : wrongColor)
            }else{
                Image(systemName: "circle.fill")
            }
                //.font()
            Text(answer.text)
                .bold()
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(gamePlay.answerSelected ? (selected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: selected ? (answer.isCorrect ? correctColor : wrongColor) : .gray, radius: 7)
        .onTapGesture {
            if !gamePlay.answerSelected{
                selected = true
                gamePlay.selectedAnswer(answer: answer)
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
            .environmentObject(GameManager())
    }
}
