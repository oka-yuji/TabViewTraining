//
//  FetchUserRepositoriesFormatter.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/18.
//

import Foundation

protocol Fetcher {
    func fetchUserRepository(query: String, completion: @escaping ([Item]) -> Void)
}


class FetchUserRepository: Fetcher {
    func fetchUserRepository(query: String, completion: @escaping ([Item]) -> Void) {
        guard let url: URL = URL(string: "https://api.github.com/search/repositories?q=\(query)") else { return print("URL Error") }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let jsonData = data else { return print("Json Error") }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let repositories = try decoder.decode(Repositories.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(repositories.items)
                }
            } catch {
                print("items Decoder Error")
            }
        }
        .resume()
    }
}

