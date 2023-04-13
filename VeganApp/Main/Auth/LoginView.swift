//
//  LoginView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/04/11.
//

import SwiftUI

struct LoginView: View {
    @State private var userId = ""
    @State private var password = ""
    
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                logoView
                userIdTextField
                passwordSecureField
                
                Button {
                    // TODO: login
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 48)
                        
                        Text("로그인")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical)
                }
                
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack {
                        Text("처음 오셨나요?")
                        
                        Text("회원가입하기")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 30)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("완료") {
                        textFieldIsFocused = false
                    }
                }
            }
        }
    }
    
    private var logoView: some View {
        HStack {
            VStack(alignment: .leading) {
                Image("homeLogoImg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Text("조금 느리게, 너만의 토마토를 키워봐")
                    .padding(.bottom, 20)
            }
            Spacer()
        }
    }
    
    private var userIdTextField: some View {
        TextField("아이디를 입력해주세요", text: $userId)
            .textInputAutocapitalization(.never)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .focused($textFieldIsFocused)
    }
    
    private var passwordSecureField: some View {
        SecureField("비밀번호를 입력해주세요", text: $password)
            .textInputAutocapitalization(.never)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .focused($textFieldIsFocused)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
