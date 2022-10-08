//
//  ContentView.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import SwiftUI

struct ContentView: View {
    @StateObject var gamePlay = GameManager()
    var body: some View {
        // spacing is the space between elements in this VStack
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 0) {
                    Text("Pop Quiz")
                        .myTitle()
                    Text("Ready to test yourself?")
                        .font(.title2)
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink{
                    GameStart()
                        .environmentObject(gamePlay)
                } label: {
                    PrimaryButton(buttonText: "Next")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            
            // Color to see the effect
            //.foregroundColor(.white)
        .background(Color("AppBackgroundColor"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
