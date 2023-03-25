//
//  Character.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/25.
//

import Foundation

struct Character: Identifiable, Decodable {
    let id: String?
    let score: Int
    let level: Int
    
    let user_idx: String
}
