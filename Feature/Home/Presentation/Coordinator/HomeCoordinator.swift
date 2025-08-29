//
//  homeCoordinator.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let repository = MockContentRepository()
        let getFeaturedUseCase = GetFeaturedContentUseCaseImpl(repository: repository)
        let getMoviesUseCase = GetMoviesUseCaseImpl(repository: repository)
        let getShowsUseCase = GetShowsUseCaseImpl(repository: repository)
        let viewModel = HomeViewModel(
            getFeaturedContentUseCase: getFeaturedUseCase,
            getMoviesUseCase: getMoviesUseCase,
            getShowsUseCase: getShowsUseCase,
            repository: repository
        )
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        homeViewController.viewModel = viewModel
        navigationController.setViewControllers([homeViewController], animated: false)
    }

}
