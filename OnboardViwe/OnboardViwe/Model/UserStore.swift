//
//  UserStore.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct Owner: Decodable {
    var avatarUrl: String?
}

struct Item: Decodable {
    var nodeId: String?
    var fullName: String?
    var owner: Owner
    var stargazersCount: Int?
    var watchersCount: Int?
    var language: String?
    var forksCount: Int?
    var openIssuesCount: Int?

}

struct Repositories: Decodable {
    var items: [Item]
}
