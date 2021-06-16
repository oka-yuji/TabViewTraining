//
//  SearchUser.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/13.
//

import SwiftUI

class SearchUser: ObservableObject {
    @Published var seawrchedRepository: [Repository] = []

    @Published var query = ""
    //    @Published var page = 1
    
    func find() {
        seawrchedRepository.removeAll()
        let url = "https://api.github.com/search/repositories?q=\(query)"
        //        let url = "https://api.github.com/search/users?q=\(query)&page=\(page)&per_page=100"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let jsonData = data else { return }
            do {
                let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                let repositories = try decoder.decode(Meta.self, from: jsonData)
               
                                DispatchQueue.main.async {
                                    self.seawrchedRepository.append(contentsOf: repositories.items)
                                    print("ここのプリント\(repositories.items[0].owner.avatarUrl)")
                                }
            } catch {
                print("error1")
            }
        }
        .resume()
    }
}
