//
//  UtilityClass.swift
//  NewsAppiOS
//
//  Created by Pragati RAWAT on 10/3/23.
//

import Foundation

class GetJsonData {
    static func getNewsApiMockData() -> [NewsData] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try! jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiResponse.data ?? []
    }
}
