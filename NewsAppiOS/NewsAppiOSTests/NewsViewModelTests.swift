//
//  NewsViewModelTests.swift
//  NewsAppiOSTests
//
//  Created by Pragati RAWAT on 10/3/23.
//

import XCTest
@testable import NewsAppiOS

class NewsViewModelTests: XCTestCase {

    var sut: NewsViewModel!
    var mockApiservice: MockNewsApiService!

    @MainActor override func setUp() {
        super.setUp()
        mockApiservice = MockNewsApiService()
        sut = NewsViewModel(newsSections: [], apiService: mockApiservice)
    }
    
    override func tearDown() {
        sut = nil
        mockApiservice = nil
        super.tearDown()
    }
   
    @MainActor func test_fetch_news() async {
        // Given
        mockApiservice.newsList = [NewsData]()

        // When
        await sut.loadLiveNews()
    
        // Assert
        XCTAssert(mockApiservice!.isFetchNewsListCalled)
    }
    
}

class MockNewsApiService: APIServiceProtocol {
    var isFetchNewsListCalled = false
    var newsList: [NewsData] = [NewsData]()
    
    func fetchNewsList() async throws -> [NewsData] {
        isFetchNewsListCalled = true
        return newsList
    }
}


class StubGenerator {
    func stubNews() -> [NewsData] {
        GetJsonData.getNewsApiMockData()
    }
}
