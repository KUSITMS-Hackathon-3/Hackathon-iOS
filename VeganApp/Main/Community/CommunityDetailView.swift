//
//  CommunityDetailView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/26.
//

import SwiftUI

struct CommunityDetailView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Image("communityImg")
                            .resizable()
                            .scaledToFit()
                            
                        Text("맨날 밖에서 사먹었었는데 메뉴를 보니 직접 해먹어볼 수 있을 것 같더라구요! 그래서 오늘은 직접 채소 비빔면을 만들어봤어요. 재료를 직접 고르고 요리하니 더 맛있는 것 같아요 ㅎㅎ 어렵지 않으니 다들 한 번쯤 시도해보면 좋을 것 같아요! ")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system(size: 18, weight: .semibold))
                            .lineSpacing(4)
                            .padding(24)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous).fill(Color(red: 0.929, green: 0.921, blue: 0.921)))
                        
                        HStack(spacing: 20) {
                            Button{
                                
                            } label: {
                                HStack(spacing: 12) {
                                    Image(systemName: "hand.thumbsup")
                                    Text("69")
                                }
                                .foregroundColor(.black)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                            
                            Button{
                                
                            } label: {
                                HStack(spacing: 12) {
                                    Image(systemName: "text.bubble")
                                    Text("4")
                                }
                                .foregroundColor(.black)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        
                        VStack(spacing: 12) {
                            HStack {
                                Text("채식러 : 와 정말 맛있을 것 같아요! 간단하고 좋네요")
                                Spacer()
                            }
                            HStack {
                                Text("토마토: 혹시 들어간 재료 알 수 있을까요??")
                                Spacer()
                            }
                        }
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system(size: 18, weight: .semibold))
                            .lineSpacing(4)
                            .padding(24)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous).fill(Color(red: 0.929, green: 0.921, blue: 0.921)))
                        
                    }
                    .padding(24)
                }
            }
            .navigationBarTitle("생각보다 간단한 채식", displayMode: .inline)
        }
    }
}

struct CommunityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityDetailView()
    }
}
