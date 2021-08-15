//
//  SearchViewModelTest.swift
//  OnboardViweTests
//
//  Created by 岡優志 on 2021/06/19.
//

import XCTest
@testable import OnboardViwe

class SearchViewModelTest: XCTestCase {
    
    var searchViewModel: SearchViewModel!
    var mockFetchreposiory: MockFetchRepository!
    var fetchUserRepository: FetchUserRepository!
    
    private var testItem: [Item] = []
    private var testError: APIError?
    private let testWord = "swift"
    private var testSuccess = false
    private var isTestError = false
    
    override func setUp() {
        mockFetchreposiory = MockFetchRepository()
        searchViewModel = .init(fetchUser: mockFetchreposiory)
    }
    
    func test入力した文字に問題がなかった場合成功を返す() {
        
        mockFetchreposiory.fetchResult = .success(mockUserData)
        
        searchViewModel.fetchGitHubRepository(query: testWord)
        
        XCTAssertTrue(searchViewModel.success)
        
    }
    
    func test入力した文字に誤りがあった場合エラーを返す() {
        
        mockFetchreposiory.fetchResult = .failure(APIError.invalidURL)
        
        searchViewModel.fetchGitHubRepository(query: testWord)
        
        XCTAssertEqual(APIError.invalidURL, searchViewModel.error)
        
    }
    
    func testネットワークエラー() {
        
        mockFetchreposiory.fetchResult = .failure(APIError.networkError)
        
        searchViewModel.fetchGitHubRepository(query: testWord)
        
        XCTAssertEqual(APIError.networkError, searchViewModel.error)
        
    }
    
}
