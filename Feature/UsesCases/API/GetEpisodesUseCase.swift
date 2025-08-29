//
//  GetEpisodesUseCase.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import Foundation

protocol GetEpisodesUseCase {
    func execute(for show: Show) async throws -> [Season]
}
