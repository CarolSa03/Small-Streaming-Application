//
//  AppCoordinator.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    let navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.backgroundColor = .black
        navigationController.navigationBar.isTranslucent = false
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        // no logic for login
        showHome()
    }
    
    private func showHome() {
        let tabCoordinator = TabCoordinator(window: window)
        add(child: tabCoordinator)
        tabCoordinator.start()
    }
}
