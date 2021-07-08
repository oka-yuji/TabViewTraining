//
//  MockFechRepository.swift
//  OnboardViweTests
//
//  Created by 岡優志 on 2021/07/08.
//

@testable import OnboardViwe

final class MockFetchRepository: Fetcher {

    var fetchResult: Result<[Item], APIError> = .success(mockUserData)
    
    func fetchUserRepository(query: String, completion: @escaping (Result<[Item], APIError>) -> Void) {
        completion(fetchResult)
    }
}
