//
//  MockFechRepository.swift
//  OnboardViweTests
//
//  Created by 岡優志 on 2021/07/08.
//

@testable import OnboardViwe

class MockFetchRepository: Fetcher {
    var item: [Item]!
    func fetchUserRepository(query: String, completion: @escaping (Result<[Item], APIError>) -> Void) {
        completion(.success(item))
    }
}
