//
//  ContentType.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import Foundation

enum ContentType: Hashable {
    case movie(Movie)
    case show(Show)
}

struct ContentSection: Hashable {
    let id: UUID
    let title: String
    let type: SectionType
    let items: [ContentType]
    
    enum SectionType {
        case featured
        case movies
        case shows
    }
    
    init(title: String, type: SectionType, items: [ContentType]) {
        self.id = UUID()
        self.title = title
        self.type = type
        self.items = items
    }
}
