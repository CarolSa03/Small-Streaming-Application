//
//  SearchCoordinator.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
       let mockRepository = MockContentRepository()

        Task {
            do {
                let movies = try await mockRepository.getMovies()
                let shows = try await mockRepository.getShows()
                let repository = SearchContentRepository(movies: movies, shows: shows)
                let useCase = SearchContentUseCaseImpl(repository: repository)
                let viewModel = SearchViewModel(searchUseCase: useCase)
                let vc = await SearchViewController(viewModel: viewModel)
                
                await MainActor.run {
                    navigationController.setViewControllers([vc], animated: false)
                }
            } catch {
                print("Failed to load search content: \(error)")
            }
        }
    }
}
