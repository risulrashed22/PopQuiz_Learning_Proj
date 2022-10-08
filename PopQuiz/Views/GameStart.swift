//
//  GameStart.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import SwiftUI

struct GameStart: View {
    @EnvironmentObject var gamePlay: GameManager
    var body: some View {
        if gamePlay.reachedEnd{
            ContentView()
        }
        else{
            QuestionView()
                .environmentObject(gamePlay)
        }
    }
}

struct GameStart_Previews: PreviewProvider {
    static var previews: some View {
        GameStart()
            .environmentObject(GameManager())
        
    }
}
