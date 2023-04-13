//
//  SignUpView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/04/13.
//

import SwiftUI

struct SignUpView: View {
    @State private var userId = ""
    @State private var nickName = ""
    @State private var password = ""
    @State private var verifyPassword = ""
    @State private var verifyPasswordMessage = ""
    
    @State private var isRightPassword = false
    @FocusState private var textFieldIsFocused: Bool
    
    @Binding var isSignUpNavLinkActive: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            userIdTextField
            nickNameTextField
            passwordSecureField
            verifyPasswordSecureField
            
            Button {
                // TODO: signUp
                if verifyPassword == password {
                    isRightPassword = true
                    verifyPasswordMessage = "비밀번호가 확인되었습니다"
                    isSignUpNavLinkActive = false
                } else {
                    isRightPassword = false
                    verifyPasswordMessage = "비밀번호가 다릅니다!"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 48)
                    
                    Text("회원가입")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.vertical)
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
        .navigationTitle("회원가입")
    }
    
    var userIdTextField: some View {
        VStack(alignment: .leading) {
            Text("아이디")
                .fontWeight(.bold)
            TextField("아이디를 입력해주세요", text: $userId)
                .textInputAutocapitalization(.never)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .focused($textFieldIsFocused)
        }
        .padding(.bottom)
    }
    
    var nickNameTextField: some View {
        VStack(alignment: .leading) {
            Text("닉네임")
                .fontWeight(.bold)
            TextField("닉네임을 입력해주세요", text: $nickName)
                .textInputAutocapitalization(.never)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .focused($textFieldIsFocused)
        }
        .padding(.bottom)
    }
    
    var passwordSecureField: some View {
        VStack(alignment: .leading) {
            Text("비밀번호")
                .fontWeight(.bold)
            SecureField("비밀번호를 입력해주세요", text: $password)
                .textInputAutocapitalization(.never)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .focused($textFieldIsFocused)
        }
        .padding(.bottom)
    }
    
    var verifyPasswordSecureField: some View {
        VStack(alignment: .leading) {
            Text("비밀번호 확인")
                .fontWeight(.bold)
            SecureField("비밀번호를 한 번 더 입력해주세요", text: $verifyPassword)
                .textInputAutocapitalization(.never)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .focused($textFieldIsFocused)
            Text(verifyPasswordMessage)
        }
        .padding(.bottom)
    }
}
