//
//  UserStore.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct User: Decodable {
    var avatarUrl: String?
}

struct Repository: Decodable {
    var nodeId: String
    var fullName: String?
    var owner: User
    var stargazersCount: Int?
    var watchersCount: Int?
    var language: String?
    var forksCount: Int?
    var openIssuesCount: Int?

}

struct Rsults: Decodable {
    var items: [Repository]
}
