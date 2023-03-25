//
//  CommunityView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/26.
//

import SwiftUI

struct CommunityView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        HStack {
                            Text("함께 나누는 \n채식 지식과 경험")
                                .font(.system(size: 24, weight: .semibold))
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .padding(.trailing)
                        }
                        .frame(height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous).fill(Color.white)
                        )
                        .padding(.bottom)
                    }
                    .padding(20)
                    
                    LazyVStack {
                        ForEach(communityData, id: \.self) { post in
                            NavigationLink {
                                CommunityDetailView()
                            } label: {
                                CommunityRowView(post: post)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Community", displayMode: .inline)
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
