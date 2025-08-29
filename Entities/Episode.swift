//
//  Episode.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import Foundation

struct Episode: Hashable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let description: String
    let duration: Int
    let imageURL: String
    let seasonNumber: Int
    let airDate: Date?
    
    init(number: Int, title: String, description: String, duration: Int, imageURL: String, seasonNumber: Int, airDate: Date?) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.description = description
        self.duration = duration
        self.imageURL = imageURL
        self.seasonNumber = seasonNumber
        self.airDate = airDate
    }
}
