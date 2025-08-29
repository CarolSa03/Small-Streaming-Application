//
//  SearchContentRepository.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

final class SearchContentRepository: SearchContentRepositoryProtocol {
    private let allMovies: [Movie]
    private let allShows: [Show]

    init(movies: [Movie], shows: [Show]) {
        self.allMovies = movies
        self.allShows = shows
    }

    func search(query: String) async throws -> [ContentType] {
        let lowercased = query.lowercased()
        let movieResults = allMovies.filter { $0.title.lowercased().contains(lowercased) }
        let showResults = allShows.filter { $0.title.lowercased().contains(lowercased) }
        return movieResults.map { .movie($0) } + showResults.map { .show($0) }
    }
}
