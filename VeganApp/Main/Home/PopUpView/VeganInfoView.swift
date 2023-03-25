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
                    .background(Color.green)
                    .foregroundColor(Color.white)
//                Spacer()
                Text("락토오보베지테리언은 유제품과 계란은섭취하지만 고기와 생선은 섭취하지 않는 채식주의자 입니다. 이러한 식습관은 고기나 생선을 섭취하지 않는 채식주의자와는 달리 다양한 영양소를 보다 쉽게 섭취할수 있습니다. ")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 20))
                    .padding(20)
                Button(action: {
                    self.showVeganInfo = false
                }) {
                    Text("Close")
                }.padding()
            }
            .frame(width: 300)
            .background(Color.white)
            .cornerRadius(20).shadow(radius: 20)
        }
    }
}
