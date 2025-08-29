//
//  GetFeaturedContentUseCaseImpl.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

final class GetFeaturedContentUseCaseImpl: GetFeaturedContentUseCase {
    private let repository: ContentRepository
    
    init(repository: ContentRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [ContentType] {
        return try await repository.getFeaturedContent()
    }
}
