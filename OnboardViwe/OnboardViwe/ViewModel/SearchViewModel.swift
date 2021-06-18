//
//  SearchViewModel.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/18.
//

import Foundation

class SearchViewModel: ObservableObject {
    let fetcher = FetchUserRepositoriesFormatter()
    
    @Published var itemData: [Item] = []
    @Published var query2 = ""
    
    func fetchRepository() {
        print("seikou")
        itemData.removeAll()
        fetcher.fetchUserRepository (query: query2) { (item) in
            self.itemData = item
        }
        
    }
    
    
//    init() {
//        self.fetcher.fetchUserRepository (query: query2) { (item) in
//            self.itemData = item
//        }
//    }
}
