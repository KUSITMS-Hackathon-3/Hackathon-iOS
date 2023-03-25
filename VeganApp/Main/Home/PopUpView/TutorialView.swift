//
//  TutorialView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/26.
//

import SwiftUI

struct TutorialView: View {
    @Binding var showTutorial: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.vertical)
            VStack(spacing: 20) {
                Text("튜토리얼")
                    .bold().padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                Spacer()
                Text("토마토를 키워보세요~!")
                    .font(.system(size: 20, weight: .bold))
                Button(action: {
                    self.showTutorial = false
                }) {
                    Text("Close")
                }.padding()
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(20).shadow(radius: 20)
        }
    }
}
