//
//  ProgressBar.swift
//  PopQuiz
//
//  Created by Risul Rashed
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(maxWidth: 400, maxHeight: 4)
                .cornerRadius(20)
                .foregroundColor(.gray)
                .opacity(0.2)
            Rectangle()
                .frame(maxWidth: progress, maxHeight: 4)
                .cornerRadius(20)
                .foregroundColor(Color("AccentColor"))
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 50)
    }
}
