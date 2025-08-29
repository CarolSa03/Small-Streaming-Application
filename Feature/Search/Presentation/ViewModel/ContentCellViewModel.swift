//
//  ContentCellViewModel.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import Foundation

struct ContentCellViewModel: Hashable {
    let id: UUID
    let title: String
    let imageURL: String
    let ContentType: ContentType
    
    init(contentType: ContentType) {
        self.ContentType = contentType
        
        switch contentType {
        case .movie(let movie):
            self.id = movie.id
            self.title = movie.title
            self.imageURL = movie.imageURL
            
        case .show(let show):
            self.id = show.id
            self.title = show.title
            self.imageURL = show.imageURL
        }
    }
}
