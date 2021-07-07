//
//  FetchUserRepositoriesFormatter.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/18.
//

import Foundation
import Combine

protocol Fetcher {
    func fetchUserRepository(query: String, completion: @escaping (Result<[Item], APIError>) -> Void)
}
class FetchUserRepository: Fetcher {
    func fetchUserRepository(query: String, completion: @escaping (Result<[Item], APIError>) -> Void) {
        guard let url: URL = URL(string: "https://api.github.com/search/repositories?q=\(query)")
        else { return completion(.failure(.invalidURL)) }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else { return completion(.failure(.networkError)) }
            
            do {
                guard let jsonData = data
                else { return completion(.failure(.parserError)) }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let object = try decoder.decode(Repositories.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(.success(object.items))
                }
                
            } catch {
                let urlSessionError = error
                urlSessionError as? APIError == APIError.networkError ? completion(.failure(.networkError)) : completion(.failure(.unknown))
                print("request failure: \(String(describing: urlSessionError))")
            }
        }
        .resume()
    }
}
