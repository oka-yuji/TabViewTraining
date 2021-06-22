//
//  UserStore.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import Foundation

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


let mockUserData: [Item]
    = [Item(nodeId: "1",
            fullName: "Apple/yuuji",
            owner:Owner.init(avatarUrl: "https://pbs.twimg.com/profile_images/1194959143469060097/DhhAs3wa_400x400.jpg"),
            stargazersCount: 1000,
            watchersCount: 1500,
            language: "Swift",
            forksCount: 9999,
            openIssuesCount: 500),
       Item(nodeId: "2",
            fullName: "Google/yuuji",
            owner:Owner.init(avatarUrl: "https://pbs.twimg.com/profile_images/1194959143469060097/DhhAs3wa_400x400.jpg"),
            stargazersCount: 500,
            watchersCount: 2000,
            language: "Swift",
            forksCount: 1200,
            openIssuesCount: 10),
       Item(nodeId: "3",
            fullName: "Amazon/yuuji",
            owner:Owner.init(avatarUrl: "https://pbs.twimg.com/profile_images/1194959143469060097/DhhAs3wa_400x400.jpg"),
            stargazersCount: 10,
            watchersCount: 150,
            language: "Swift",
            forksCount: 5,
            openIssuesCount: 25),
       Item(nodeId: "4",
            fullName: "FaceBook/yuuji",
            owner:Owner.init(avatarUrl: "https://pbs.twimg.com/profile_images/1194959143469060097/DhhAs3wa_400x400.jpg"),
            stargazersCount: 320,
            watchersCount: 15,
            language: "Swift",
            forksCount: 30,
            openIssuesCount: 4),
       Item(nodeId: "5",
            fullName: "Tesla/yuuji",
            owner:Owner.init(avatarUrl: "https://pbs.twimg.com/profile_images/1194959143469060097/DhhAs3wa_400x400.jpg"),
            stargazersCount: 3,
            watchersCount: 3,
            language: "Swift",
            forksCount: 1,
            openIssuesCount: 1),
       Item(nodeId: "6",
            fullName: "Oka/yuuji",
            owner:Owner.init(avatarUrl: "https://pbs.twimg.com/profile_images/1194959143469060097/DhhAs3wa_400x400.jpg"),
            stargazersCount: 19500,
            watchersCount: 20000,
            language: "Swift",
            forksCount: 10000,
            openIssuesCount: 12000),
    ]
