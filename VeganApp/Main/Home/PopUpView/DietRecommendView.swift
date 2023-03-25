//
//  DietRecommendView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/26.
//

import SwiftUI

struct DietRecommendView: View {
    @Binding var showDietRecommend: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.vertical)
            VStack(spacing: 20) {
                
                Text("식단 추천")
                    .bold().padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                Image("DietRecommend")
                    .frame(width: 300, height: 200)
                
                ScrollView {
                    HStack {
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("아보카도 오픈 샌드위치")
                                    .font(.system(size: 20, weight: .bold))
                                Text("아보카도 슬라이스와 토마토, 버섯 등을 올려 만든 샌드위치입니다.")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.system(size: 18))
                            }
                            .padding(.bottom, 20)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("이점")
                                    .font(.system(size: 20, weight: .bold))
                                Text("채식 샌드위치로 온실 가스 감축을 도모하고 대량의 기름과 토양, 토양 유실 등의 자원을 보존할 수 있습니다.")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.system(size: 18))
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
                Spacer()
                
                Button(action: {
                    self.showDietRecommend = false
                }) {
                    Text("Close")
                }.padding()
                    
            }
            .frame(width: 340, height: 580)
            .background(Color.white)
            .cornerRadius(20).shadow(radius: 20)
        }
    }
}
