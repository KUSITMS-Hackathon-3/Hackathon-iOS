//
//  HomeView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/25.
//

import SwiftUI

struct HomeView: View {
    @State private var showVeganInfo = false
    @State private var showDietRecommend = false
    @State private var showTutorial = true
    
    var body: some View {
        ZStack {
            VStack{
                Text("danto")
                    .font(.system(size: 40, design: .rounded))
                    .bold()
                    .padding()
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("채식 시작한 지 125일 때")
                            .padding(.bottom, 8)
                        Text("멋쟁이 토마토")
                        HStack {
                            Text("레벨 1")
                            ProgressView(value: 40, total: 100)
                                .tint(.green)
                                .scaleEffect(x: 1, y: 4)
                                .frame(width: 100)
                        }
                    }
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding(20)
                }
                
                Spacer()
                Spacer()
                Spacer()
                
                HStack {
                    Button {
                        showVeganInfo = true
                    } label: {
                        RoundedRectangle(cornerRadius: 28)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button {
                        showDietRecommend = true
                    } label: {
                        RoundedRectangle(cornerRadius: 28)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                    }
                }
                .padding(20)
                
                RoundedRectangle(cornerRadius: 28)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                
                HStack {
                    RoundedRectangle(cornerRadius: 28)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                    
                    Spacer()
                    
                    Button {
                        showTutorial = true
                    } label: {
                        RoundedRectangle(cornerRadius: 28)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.green)
                    }
                }
                .padding(20)
            }
            
            if $showVeganInfo.wrappedValue {
                VeganInfoView(showVeganInfo: self.$showVeganInfo)
            }
            
            if $showDietRecommend.wrappedValue {
                DietRecommendView(showDietRecommend: self.$showDietRecommend)
            }
            
            if $showTutorial.wrappedValue {
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
                            self.showTutorial = false
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
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
