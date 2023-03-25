//
//  User.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/25.
//

import Foundation

struct User: Identifiable, Decodable {
    let user_idx: String?
    let id: String
    let nickname: String
    let level: Int
}
