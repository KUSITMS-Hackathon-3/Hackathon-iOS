//
//  VeganInfoView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/26.
//

import SwiftUI

struct VeganInfoView: View {
    @Binding var showVeganInfo: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.vertical)
            VStack(spacing: 20) {
                Text("오늘의 채식 지식")
                    .bold().padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                Spacer()
                Text("채식은 좋습니다!")
                    .font(.system(size: 20, weight: .bold))
                Button(action: {
                    self.showVeganInfo = false
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
