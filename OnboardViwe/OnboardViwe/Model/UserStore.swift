//
//  UserStore.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct Item: Decodable {
    var login: String
    var id: Int
    var node_id: String
    var avatar_url: String
    var gravatar_id: String
    var url: String
    var html_url: String
    var followers_url: String
    var following_url: String
    var gists_url: String
    var starred_url: String
    var subscriptions_url: String
    var organizations_url: String
    var repos_url: String
    var events_url: String
    var received_events_url: String
    var type: String
    var site_admin: Bool
    var score: Int
}

struct UserStore: Decodable {
    var items: [Item]
}

class Test {
    var a: String
    var b: String
    var c: String
    
    init(a: String, b: String, c: String) {
        self.a = a
        self.b = b
        self.c = c
    }
}
