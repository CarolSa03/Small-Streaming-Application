//
//  SearchContentUseCase.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

protocol SearchContentUseCase {
    func execute(query: String) async throws -> [ContentType]
}
