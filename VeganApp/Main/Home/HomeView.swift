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
    @State private var showTutorial = false
    
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
                        Text("멋쟁이 토마토")
                            .padding(.bottom, 8)
                        Text("채식 시작한 지 125일 때")
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
                        // 상점
                    } label: {
                        RoundedRectangle(cornerRadius: 28)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                    }
                }
                .padding(20)
                
                Image("Level1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200, alignment: .center)
                
                HStack {
                    Button {
                        showDietRecommend = true
                    } label: {
                        RoundedRectangle(cornerRadius: 28)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.yellow)
                    }
                    
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
                TutorialView(showTutorial: self.$showTutorial)
            }
            
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
