//
//  TabCoordinator.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class TabCoordinator: NSObject, Coordinator {
    let window: UIWindow
    let navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    private let tabBarController: TabBarController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.tabBarController = TabBarController()
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    func start() {
        setupTabs()
    }
    
    private func setupTabs() {
        let homeNav = UINavigationController()
        let searchNav = UINavigationController()
        let movieNav = UINavigationController()
        let tvShowNav = UINavigationController()
        [homeNav, searchNav, movieNav, tvShowNav].forEach { nav in
            nav.navigationBar.barStyle = .black
            nav.navigationBar.backgroundColor = .black
            nav.navigationBar.isTranslucent = false
        }
        
        let homeCoordinator = HomeCoordinator(navigationController: homeNav)
        let searchCoordinator = SearchCoordinator(navigationController: searchNav)
        let movieCoordinator = MovieCoordinator(navigationController: movieNav)
        let tvShowCoordinator = TVShowCoordinator(navigationController: tvShowNav)
        
        add(child: homeCoordinator)
        add(child: searchCoordinator)
        add(child: movieCoordinator)
        add(child: tvShowCoordinator)
        
        homeCoordinator.start()
        searchCoordinator.start()
        movieCoordinator.start()
        tvShowCoordinator.start()
        
        tabBarController.viewControllers = [homeNav, searchNav, movieNav, tvShowNav]
        tabBarController.delegate = self
    }
    
    func add(child coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
}

extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected tab: \(tabBarController.selectedIndex)")
    }
}
