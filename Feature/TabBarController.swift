//
//  TabBarController.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let floatingTabBar = FloatingTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupFloatingTabBar()
    }
    
    private func setupUI() {
        tabBar.isHidden = true
        view.backgroundColor = .black
    }
    
    private func setupFloatingTabBar() {
        view.addSubview(floatingTabBar)
        floatingTabBar.delegate = self
        
        floatingTabBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            floatingTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            floatingTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            floatingTabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            floatingTabBar.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        let tabItems = [
            FloatingTabBar.TabItem(title: "Home", icon: "house", selectedIcon: "house.fill"),
            FloatingTabBar.TabItem(title: "Search", icon: "magnifyingglass", selectedIcon: "magnifyingglass"),
            FloatingTabBar.TabItem(title: "Movies", icon: "film", selectedIcon: "film.fill"),
            FloatingTabBar.TabItem(title: "TV Shows", icon: "tv", selectedIcon: "tv.fill")
        ]
        
        floatingTabBar.configure(with: tabItems)
    }
}
extension TabBarController: FloatingTabBarDelegate {
    func tabBar(_ tabBar: FloatingTabBar, didSelectTabAt index: Int) {
        selectedIndex = index
    }
}
