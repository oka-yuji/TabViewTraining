//
//  UserStore.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct User: Decodable {
    var login: String
    var avatarUrl: String
    
    
    
}


struct Repository: Decodable {
    var id: Int
    var nodeId: String
    var name: String
    var fullName: String
    var language: String
    var stargazersCount: Int
    var watchers: Int
    var forksCount: Int
    var openIssuesCount: Int
    var owner: User
    

//        var login: String
//        var id: Int
//        var node_id: String
//        var avatar_url: String
//        var gravatar_id: String
//        var url: String
//        var html_url: String
//        var followers_url: String
//        var following_url: String
//        var gists_url: String
//        var starred_url: String
//        var subscriptions_url: String
//        var organizations_url: String
//        var repos_url: String
//        var events_url: String
//        var received_events_url: String
//        var type: String
//        var site_admin: Bool
//        var score: Int
}

struct Meta: Decodable {
    var items: [Repository]
}
