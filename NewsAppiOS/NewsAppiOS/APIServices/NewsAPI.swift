//
//  NewsAPIService.swift
//  NewsAppiOS
//
//  Created by Pragati RAWAT on 10/2/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchNewsList() async throws -> [NewsData]
}

struct NewsAPI: APIServiceProtocol {
    init() {}
    
    private let apiKey = "cb68f438c2518e73663da8ed33246985"
  
    private let session = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetchNewsList() async throws -> [NewsData] {
        try await fetchNewsArticles(from: generateNewsURL(urlName: Constants.NewsAPIConstants.apiName))
    }
    
    private func fetchNewsArticles(from url: URL?) async throws -> [NewsData] {
        guard let apiURL = url else { return [] }
        
        let (data, response) = try await session.data(from: apiURL)
        
        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
        }
        
        switch response.statusCode {
        case 200:
            let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)
            return apiResponse.data ?? []
           
        default:
            throw generateError(description: "A server error occured")
        }
    }
    
    private func generateError(code: Int = 1, description: String) -> Error {
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
    private func generateNewsURL(urlName: String) -> URL? {
        var url = Constants.GlobalApiConstant.mainUrl + urlName
        url += "access_key=\(apiKey)"
        
        return URL(string: url)
    }
}
