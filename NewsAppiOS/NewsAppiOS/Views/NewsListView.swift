//
//  NewsListView.swift
//  NewsAppiOS
//
//  Created by Pragati RAWAT on 10/2/23.
//
import SwiftUI

struct NewsListView: View {
    let newsSections: [NewsData]
    
    var body: some View {
        List {
            ForEach(newsSections) { section in
                NewsRowView(newsSection: section)
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct NewsListView_Previews: PreviewProvider {
        
    static var previews: some View {
        NavigationView {
            NewsListView(newsSections: NewsData.previewData)
        }
    }
}

