//
//  Movie.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import Foundation

struct Movie: Hashable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let imageURL: String
    let duration: Int
    let rating: String
    let year: Int
    let isOriginal: Bool
    
    init(title: String, description: String, imageURL: String, duration: Int, rating: String, year: Int, isOriginal: Bool = false) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.duration = duration
        self.rating = rating
        self.year = year
        self.isOriginal = isOriginal
    }
}
