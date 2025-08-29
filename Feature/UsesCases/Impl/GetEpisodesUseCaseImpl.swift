//
//  GetEpisodesUseCaseImpl.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

final class GetEpisodesUseCaseImpl: GetEpisodesUseCase {
    private let repository: ContentRepository
    
    init(repository: ContentRepository) {
        self.repository = repository
    }
    
    func execute(for show: Show) async throws -> [Season] {
        return try await repository.getEpisodes(for: show)
    }
}

extension ContentRepository {
    func getEpisodes(for show: Show) async -> [Season] {
        fatalError("not implemented")
    }
}
