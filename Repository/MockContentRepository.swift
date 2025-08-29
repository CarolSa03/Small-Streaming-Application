//
//  MockContentRepository.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class MockContentRepository: ContentRepository {
    
    func getFeaturedContent() async throws -> [ContentType] {
        try await Task.sleep(nanoseconds: 500_000_000)
        return [
            .show(Show(title: "Show 1", description: "The number 1 show", imageURL: "image", seasons: 1, episodes: 12, rating: "TV-14", year: 2023)), .movie(Movie(title: "MOVIE 1", description: "The number 1 movie", imageURL: "image", duration: 2, rating: "PG-13", year: 2000))
        ]
    }
    
    func getMovies() async throws -> [Movie] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return[
            Movie(title: "Movie YAY", description: "A very yay movie", imageURL: "image", duration: 1, rating: "PG-13", year: 2003),
                       Movie(title: "Movie Original", description: "An original movie", imageURL: "image", duration: 3, rating: "PG-13", year: 1998, isOriginal: true),
                       Movie(title: "Epic Adventure", description: "An epic journey through mystical lands.", imageURL: "image", duration: 2, rating: "PG-13", year: 2015),
                       Movie(title: "Romantic Escape", description: "A tale of love and destiny.", imageURL: "image", duration: 1, rating: "PG", year: 2018),
                       Movie(title: "Sci-Fi Odyssey", description: "Exploring the vastness of space and time.", imageURL: "image", duration: 2, rating: "PG-13", year: 2021),
                       Movie(title: "Comedy Nights", description: "Laughs and fun all night long.", imageURL: "image", duration: 1, rating: "PG", year: 2020),
                       Movie(title: "Thriller Edge", description: "A suspense-filled story that keeps you guessing.", imageURL: "image", duration: 2, rating: "R", year: 2019)
        ]
    }
    
    func getShows() async throws -> [Show] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return[
            Show(title: "Show 2", description: "The second show", imageURL: "image", seasons: 2, episodes: 24, rating: "PG-18", year: 2020),
                        Show(title: "Mystery Manor", description: "Unravel secrets in a haunted mansion.", imageURL: "image", seasons: 3, episodes: 30, rating: "TV-MA", year: 2022),
                        Show(title: "Cooking Stars", description: "Top chefs compete for the ultimate prize.", imageURL: "image", seasons: 5, episodes: 50, rating: "TV-PG", year: 2017),
                        Show(title: "Tech Talk", description: "Exploring the future of technology and innovation.", imageURL: "image", seasons: 1, episodes: 10, rating: "TV-G", year: 2024),
                        Show(title: "Space Explorers", description: "Journey with astronauts into the unknown.", imageURL: "image", seasons: 4, episodes: 40, rating: "TV-PG", year: 2019),
                        Show(title: "Crime Files", description: "Investigate chilling crimes with detectives.", imageURL: "image", seasons: 6, episodes: 72, rating: "TV-MA", year: 2018)
                    ]
    }
    
    func getOriginals() async throws -> [ContentType] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return[
            .show(Show(title: "Show 3", description: "The third show", imageURL: "image", seasons: 2, episodes: 24, rating: "PG-18", year: 2020))
        ]
    }
    
    func getEpisodes(for show: Show) async throws -> [Season] {
        try await Task.sleep(nanoseconds: 500_000_000)
        var seasons: [Season] = []
        
        for seasonNumber in 1...4 {
            var episodes: [Episode] = []
            for episodeNumber in 1...10 {
                let episode = Episode(number: episodeNumber, title: "\(show.title) S\(seasonNumber) E\(episodeNumber)", description: "Exciting", duration: Int.random(in: 1...100), imageURL: "image", seasonNumber: Int.random(in: 1...3), airDate: Date().addingTimeInterval(-Double.random(in: 0...(365*24*3600))))
                episodes.append(episode)
            }
            let season = Season(number: seasonNumber, title: "Season \(seasonNumber)", episodes: episodes)
            seasons.append(season)
        }
        return seasons
    }
}
