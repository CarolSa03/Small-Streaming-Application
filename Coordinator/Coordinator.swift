//
//  Coordinator.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func add(child: Coordinator) {
        childCoordinators.append(child)
    }
    
    func remove(child: Coordinator) {
        childCoordinators.removeAll { $0 === child }
    }
}
