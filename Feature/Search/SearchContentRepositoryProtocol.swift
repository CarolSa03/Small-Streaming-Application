//
//  SearchContentRepositoryProtocol.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

protocol SearchContentRepositoryProtocol {
    func search(query: String) async throws -> [ContentType]
}
