//
//  TextExtension.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import Foundation
import SwiftUI


// Extending built in Text modifier to use everywhere
extension Text{
    func myTitle() -> some View{
        self.fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
            .font(.title)
    }
}
