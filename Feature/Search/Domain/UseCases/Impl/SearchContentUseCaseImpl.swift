//
//  SearchContentUseCaseImpl.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

final class SearchContentUseCaseImpl : SearchContentUseCase {
    private let repository: SearchContentRepositoryProtocol
    
    init(repository: SearchContentRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(query: String) async throws -> [ContentType] {
        try await repository.search(query: query)
    }
}
