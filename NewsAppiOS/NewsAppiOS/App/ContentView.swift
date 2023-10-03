//
//  ContentView.swift
//  NewsAppiOS
//
//  Created by Pragati RAWAT on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var newsViewModel = NewsViewModel()

    var body: some View {
        NavigationView {
        NewsListView(newsSections: newsSections)
            .overlay(overlayView)
            .task {
                await loadTask()
            }
            .navigationTitle(String(localized: "navigation.title"))
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch newsViewModel.phase {
        case .empty:
            ProgressView()
        case .success(let sections) where sections.isEmpty:
            ErrorView(text: String(localized: "error.view.text"), image: nil)
        case .failure(let error):
            ErrorView(text: error.localizedDescription, image: nil)
        default: EmptyView()
        }
    }
    
    private var newsSections: [NewsData] {
        if case let .success(newsSections) = newsViewModel.phase {
            return newsSections
        } else {
            return []
        }
    }
    
    @Sendable
    private func loadTask() async {
        await newsViewModel.loadLiveNews()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
