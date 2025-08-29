//
//  GetShowsUseCaseImpl.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

final class GetShowsUseCaseImpl: GetShowsUseCase {
    private let repository: ContentRepository
    
    init(repository: ContentRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Show] {
        return try await repository.getShows()
    }
}
