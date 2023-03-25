//
//  CommunityRowView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/26.
//

import SwiftUI

struct CommunityRowView: View {
    let post: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post[0])
                .font(.system(size: 24, weight: .semibold))
            Text(post[1])
                .lineLimit(1)
                .font(.system(size: 16))
            HStack {
                Spacer()
                
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text(post[2])
                }
                .padding(.trailing, 4)
                HStack {
                    Image(systemName: "text.bubble")
                    Text(post[3])
                }
            }
            .font(.system(size: 16, weight: .semibold))
        }
        .foregroundColor(.black)
        .padding()
        .background(RoundedRectangle(cornerRadius: 16, style: .continuous).fill(Color.white))
        
    }
}
