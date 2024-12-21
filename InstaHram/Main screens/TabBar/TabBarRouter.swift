//
//  TabBarRouter.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol TabBarRouterInput {
    func switchToTab(index: Int)
}

class TabBarRouter: TabBarRouterInput {
    weak var tabBarController: TabBarController?
    
    func switchToTab(index: Int) {
        guard index < tabBarController?.viewControllers?.count ?? 0 else { return }
        tabBarController?.selectedIndex = index
    }
}
