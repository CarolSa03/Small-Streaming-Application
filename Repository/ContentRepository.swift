//
//  ContentRepository.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

protocol ContentRepository {
    func getFeaturedContent() async throws -> [ContentType]
    func getMovies() async throws -> [Movie]
    func getShows() async throws -> [Show]
    func getEpisodes(for show: Show) async throws -> [Season]
}
