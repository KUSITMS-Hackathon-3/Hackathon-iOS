//
//  User.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/25.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: String?
    let userId: String
    let nickname: String
    let veganStage: Int?
    let score: Int?
    let level: Int?
}
