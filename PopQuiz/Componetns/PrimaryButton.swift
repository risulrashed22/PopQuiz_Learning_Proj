//
//  PrimaryButton.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import SwiftUI

struct PrimaryButton: View {
    var buttonText: String
    var buttonColor: Color = Color("AccentColor")
    var body: some View {
        Text(buttonText)
            .foregroundColor(.white)
            .fontWeight(Font.Weight.heavy)
            .padding()
            .padding(.horizontal)
            .background(buttonColor)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(buttonText: "Simple")
    }
}
