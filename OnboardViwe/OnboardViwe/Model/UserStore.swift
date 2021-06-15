//
//  UserStore.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

//struct Owner: Decodable {
//    var login: String
//    var id: Int
//    var nodeID: String
//    var avatarURL: String
//    var url: String
//    var html_url: String
//    var followers_url: String
//    var following_url: String
//    var gists_url: String
//    var starred_url: String
//    var subscriptions_url:String
//    var organizations_url: String
//    var repos_url: String
//    var events_url: String
//    var received_events_url: String
//    var type: String
//    var site_admin: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case login
//        case id
//        case nodeID = "node_id"
//        case avatarURL = "avatar_url"
//        case url
//        case html_url
//        case followers_url
//        case following_url
//        case gists_url
//        case starred_url
//        case subscriptions_url
//        case organizations_url
//        case repos_url
//        case events_url
//        case received_events_url
//        case type
//        case site_admin
//    }
//
//}

struct Item: Codable {
//    var id: Int
//    var node_id: String
//    var name: String
//    var full_name: String
//    var owner: [Owner]
    
//    enum CoodingKeys: String, CodingKey {
//        case login
//        case id
//        case nodeID = "node_id"
//        case avatar_url
//        case gravatar_id
//        case url
//        case html_url
//        case followers_url
//        case following_url
//        case gists_url
//        case starred_url
//        case subscriptions_url
//        case organizations_url
//        case repos_url
//        case events_url
//        case received_events_url
//        case type
//        case site_admin
//        case score
//    }
    
   
    
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

struct User: Codable {
    var items: [Item]
}
