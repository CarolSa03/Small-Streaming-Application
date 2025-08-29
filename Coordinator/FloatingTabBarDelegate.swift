//
//  FloatingTabBarDelegate.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

protocol FloatingTabBarDelegate: AnyObject {
    func tabBar(_ tabBar: FloatingTabBar, didSelectTabAt index: Int)
}
