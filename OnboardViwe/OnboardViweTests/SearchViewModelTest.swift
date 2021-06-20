//
//  SearchViewModelTest.swift
//  OnboardViweTests
//
//  Created by 岡優志 on 2021/06/19.
//

import XCTest
@testable import OnboardViwe

class SearchViewModelTest: XCTestCase {
    
    let fetcher = FetchUserRepository()
    let testQuery = "swift"
    let itemData:[Item] = []
    
    func testAsync() {
        let exp = XCTestExpectation(description: testQuery)
        fetcher.fetchUserRepository(query: testQuery) { item in
            XCTAssertEqual(item[0].fullName!, "apple/swift")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
    }
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}
