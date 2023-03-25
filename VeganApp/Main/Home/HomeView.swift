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
            
            VStack {
                Spacer()
                
                Image("homeBackground")
            }
            .frame(width: 300)
            
            VStack {
                Spacer()
                Spacer()
                Spacer()
//                Image("homeBackground")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 320)
//                    .clipped()
                
                Image("Level3")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180, alignment: .center)
                
                Spacer()
            }
            
            VStack{
//                Text("danto")
//                    .font(.system(size: 40, design: .rounded))
//                    .bold()
//                    .padding()
                Image("homeLogoImg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("채린이 🍀")
                            .padding(.bottom, 8)
                        Text("단토와 함께한지 125일 때")
                        HStack {
                            Text("레벨 1")
                            ProgressView(value: 40, total: 100)
                                .tint(.green)
                                .scaleEffect(x: 1, y: 4)
                                .frame(width: 100)
                        }
                    }
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding(.horizontal, 28)
                    .padding(.bottom, 60)
                }
                
                HStack {
                    Button {
                        showVeganInfo = true
                    } label: {
                        Image("homeVeganinfo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                    }
                    
                    Spacer()
                    
                    Button {
                        // 상점
                    } label: {
                        Image("homeShop")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)

                    }
                }
                
//                Spacer()
                Spacer()
                Spacer()
                
                HStack {
                    Button {
                        showDietRecommend = true
                    } label: {
                        Image("homeDietRecommend")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .padding(.horizontal, 4)
                    }
                    
                    Spacer()
                    
                    Button {
                        showTutorial = true
                    } label: {
                        Image("homeTutorial")
                            .padding(.horizontal, 20)
                            
                    }
                }
                
                
                Spacer()
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
