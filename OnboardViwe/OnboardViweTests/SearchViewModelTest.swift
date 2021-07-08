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
   
    override func setUp() {
        searchViewModel = .init(fetchUser: MockFetchRepository())
    }
    
    func testAsync() {
        let item: [Item] = mockUserData
        searchViewModel.query = "swift"
        mockFetchreposiory.fetchResult = .success(item)
        searchViewModel.fetcher()
        
        XCTAssertTrue(searchViewModel.success)
       
    }
    
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}
