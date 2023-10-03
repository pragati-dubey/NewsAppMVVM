//
//  ErrorView.swift
//  NewsAppiOS
//
//  Created by Pragati RAWAT on 10/3/23.
//

import SwiftUI

struct ErrorView: View {
    
    let text: String
    let image: Image?
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            if let image = self.image {
                image
                    .imageScale(.large)
                    .font(.system(size: 52))
            }
            Text(text)
            Spacer()
        }
    }
    
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(text: String(localized: "news.loading.error"), image: Image(systemName: ""))
    }
}
