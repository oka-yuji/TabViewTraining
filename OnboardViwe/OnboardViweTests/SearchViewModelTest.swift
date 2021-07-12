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
        
        searchViewModel.fetcher(query: testWord)
        
        XCTAssertTrue(searchViewModel.success)
        
    }
    
    func test入力した文字に誤りがあった場合エラーを返す() {
        
        mockFetchreposiory.fetchResult = .failure(APIError.invalidURL)
        
        searchViewModel.fetcher(query: testWord)
        
        XCTAssertNotNil(searchViewModel.error)
        
    }
    
    func testネットワークエラー() {
        
        mockFetchreposiory.fetchResult = .failure(APIError.networkError)
        
        searchViewModel.fetcher(query: testWord)
        
        XCTAssertEqual(APIError.networkError, searchViewModel.error)
        
    }
    
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
}
