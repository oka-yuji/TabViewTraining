//
//  SearchViewModel.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/18.
//

import Foundation

class SearchViewModel: ObservableObject {
    // 疎結合
    private let fetchUser: Fetcher
    init(fetchUser: Fetcher) {
        self.fetchUser = fetchUser
    }
    // Viewとのバインディング変数プロパティ
    @Published var itemData: [Item] = []
    @Published var query = ""
    @Published var error: APIError?
    
    func fetcher() {
        let queryText = query
        itemData.removeAll()
        
        fetchUser.fetchUserRepository(query: queryText) { [unowned self] (result) in
            switch result {
            case .success(let suc):
                itemData.append(contentsOf: suc)
            case .failure(let error):
                self.error = error
            }
        }
    }
    
//    let fetched = FetchUserRepository()
//    func fetchRepository() {
//        itemData.removeAll()
//        self.fetched.fetchUserRepository(query: query) { (items) in
//            self.itemData.append(contentsOf: items)
//        }
//    }
}
