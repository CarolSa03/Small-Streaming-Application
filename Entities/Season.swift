//
//  Season.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import Foundation

struct Season: Hashable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let episodes: [Episode]
    
    init(number: Int, title: String, episodes: [Episode]) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.episodes = episodes
    }
}
