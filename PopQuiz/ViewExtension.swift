//
//  ViewExtension.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import Foundation
import SwiftUI

extension VStack{
    func VStackPage() -> some View{
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
            //.edgesIgnoringSafeArea(.all)
            .background(Color("AppBackgroundColor"))
    }
}
