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
