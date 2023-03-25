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
                    .background(Color.green)
                    .foregroundColor(Color.white)
//                Spacer()
                VStack(alignment: .leading) {
                    Text("토마토를 어떻게 키울수 있는가? 토마토는 이렇게 성장합니다!")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 20))
                        .padding(.bottom, 10)
                    
                    HStack {
                        VStack {
                            Text("LV.1")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.system(size: 20))
                            Text("씨앗")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.system(size: 20))
                        }
                        Spacer()
                        Divider()
                        Spacer()
                        VStack {
                            Text("LV.1")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.system(size: 20))
                            Text("씨앗")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.system(size: 20))
                        }
                        Spacer()
                        Divider()
                        Spacer()
                        VStack {
                            Text("LV.1")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.system(size: 20))
                            Text("씨앗")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.system(size: 20))
                        }
                    }
                    .padding(.horizontal, 28)
                    .padding(.bottom, 10)
                    .frame(height: 32)
                    
                    Text("채식 식단을 인증하거나, 레시피를 업로드할 시에 리워드가 지급됩니다. 일정 리워드가 쌓이면 레벨이 올라갑니다. ")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 20))
                        .padding(.bottom, 10)
                    
                    
                    Text("앱은 이렇게 사용할 수 있어요!")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 20))
                        .padding(.bottom, 10)
                    
                    Text("1.홈 화면")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 16))
                    
                    Text("책 아이콘: 채식 지식을 전달해드려요! ")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 14))
                    
                    Text("협탁 아이콘: 채식 식단을 추천해드려요!")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 14))
                    
                    Text("가게 아이콘: 토마토를 꾸밀 수 있어요! ")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 14))
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .leading) {
                        Text("2. 레시피 아이콘: 레시피 탐색 및 공유해요")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system(size: 16))
                        
                        Text("3. 식단 아이콘: 식단 인증을 할 수 있어요")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system(size: 16))
                        
                        Text("4. 커뮤니티 아이콘: 채식 지식과 경험을 나눠요")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system(size: 16))
                        
                        Text("5. 마이페이지 아이콘: 등급과 설정을 변경해요 ")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system(size: 16))
                    }
                    
                    
                    
                    
                }
                .padding()
                
                Button(action: {
                    self.showTutorial = false
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
