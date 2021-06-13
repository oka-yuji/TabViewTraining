//
//  SearchUser.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/13.
//

import SwiftUI

class SearchUser: ObservableObject {
    @Published var searchedUser: [Item] = []
    
    @Published var query = ""
    
    @Published var page = 1
    
    func find() {
        
    }
}
