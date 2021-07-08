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
    @Published var success = false
    
    func fetcher() {
        itemData.removeAll()
        success = false
        fetchUser.fetchUserRepository(query: query) { [unowned self] (result) in
            switch result {
            case .success(let suc):
                itemData.append(contentsOf: suc)
                success = true
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
