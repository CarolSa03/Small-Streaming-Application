//
//  GetFeaturedContentUseCase.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

protocol GetFeaturedContentUseCase {
    func execute() async throws -> [ContentType]
}
