//
//  TabBarController.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

class TabBarController: UITabBarController {
    var router: TabBarRouter?
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let feedVC = UINavigationController(rootViewController: FeedViewController())
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)
        
        let exploreVC = ExploreViewController()
        exploreVC.tabBarItem = UITabBarItem(title: "Explore", image: nil, tag: 1)
        
        let newPostVC = NewPostViewController()
        newPostVC.tabBarItem = UITabBarItem(title: "New Post", image: nil, tag: 2)
        
        let notificationsVC = NotificationsViewController()
        notificationsVC.tabBarItem = UITabBarItem(title: "Notifications", image: nil, tag: 3)
        
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 4)
        
        viewControllers = [feedVC, exploreVC, newPostVC, notificationsVC, profileVC]
        
        router?.tabBarController = self
    }

}
