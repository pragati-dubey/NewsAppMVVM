//
//  NewsViewModel.swift
//  NewsAppiOS
//
//  Created by Pragati RAWAT on 10/3/23.
//

import Foundation

enum DataFetchPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}

@MainActor
class NewsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[NewsData]>.empty
    let apiService: APIServiceProtocol
    
    init(newsSections: [NewsData]? = nil, apiService: APIServiceProtocol = NewsAPI()) {
        self.apiService = apiService
        
        if let sections = newsSections {
            self.phase = .success(sections)
        } else {
            self.phase = .empty
        }
    }
    
    func loadLiveNews() async {
        if Task.isCancelled { return }
        phase = .empty
        do {
            let sections = try await apiService.fetchNewsList()
            if Task.isCancelled { return }
            phase = .success(sections)
        } catch {
            if Task.isCancelled { return }
            print(error.localizedDescription)
            phase = .failure(error)
        }
    }
}
