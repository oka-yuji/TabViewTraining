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
    @Published var query2 = "swift"
    
    func fetchRepository() {
        itemData.removeAll()
        self.fetcher.fetchUserRepository(query: query2) { (item) in
            DispatchQueue.main.async {
            self.itemData = item
            print("seikou")
                print(item[0].fullName ?? "")
            }
        }
    }
}
