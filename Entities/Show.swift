//
//  Show.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import Foundation

struct Show: Hashable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let imageURL: String
    let seasons: Int
    let episodes: Int
    let rating: String
    let year: Int
    
    init(title: String, description: String, imageURL: String, seasons: Int, episodes: Int, rating: String, year: Int) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.seasons = seasons
        self.episodes = episodes
        self.rating = rating
        self.year = year
    }
}

extension Show {
    var seasonsCount: Int {
        return 3
    }
}
