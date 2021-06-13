//
//  UserStore.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct Item: Decodable {
    var node_id: String
    var login: String
    var avatar_url: String
}

struct UserStore: Decodable {
    var items: [Item]
}

enum CodingKeys: String, CodingKey {
    case nodeId = "node_id"
    case avatarUrl = "avatar_url"
}
