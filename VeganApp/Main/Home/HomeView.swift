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
                    
                    RoundedRectangle(cornerRadius: 28)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.green)
                }
                .padding(20)
            }
            
            if $showVeganInfo.wrappedValue {
                VeganInfoView(showVeganInfo: self.$showVeganInfo)
            }
            
            if $showDietRecommend.wrappedValue {
                ZStack {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.vertical)
                    VStack(spacing: 20) {
                        Text("식단 추천")
                            .bold().padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                        Spacer()
                        Text("채식은 좋습니다!")
                            .font(.system(size: 20, weight: .bold))
                        Button(action: {
                            self.showDietRecommend = false
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
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
