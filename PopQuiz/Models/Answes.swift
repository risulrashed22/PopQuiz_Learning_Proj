//
//  Answes.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import Foundation
import SwiftUI

// Identifiable means, each element created with id will be identifiable with unique id
struct Answer: Identifiable{
    var id = UUID() // will generate random UUID for identification
    var text: AttributedString
    var isCorrect: Bool
}
