//
//  GetMoviesUseCaseImpl.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

final class GetMoviesUseCaseImpl: GetMoviesUseCase {
    private let repository: ContentRepository
    
    init(repository: ContentRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Movie] {
        return try await repository.getMovies()
    }
}
