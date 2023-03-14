//
//  TabbarController.swift
//  Furnis
//
//  Created by user1 on 14/03/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    private let mainVC = MainPageController(presenter: MainPagePresenter())
    private let searchVC = MainPageController(presenter: MainPagePresenter())
    private let cartVC = MainPageController(presenter: MainPagePresenter())
    private let fovoriteVC = MainPageController(presenter: MainPagePresenter())
    private let profileVC = MainPageController(presenter: MainPagePresenter())

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor.main
        tabBar.unselectedItemTintColor = .white
        
        changeRadiusOfTabBar()
        tabbarSetup()
        
        viewControllers = [
            mainVC,
            searchVC,
            cartVC,
            fovoriteVC,
            profileVC
        ]
    }
    
    private func tabbarSetup() {
        mainVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "search"), tag: 1)
        cartVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "cart"), tag: 2)
        fovoriteVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "heart"), tag: 3)
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "user"), tag: 4)
    
        mainVC.tabBarItem.selectedImage = UIImage(named: "circleHome")
        searchVC.tabBarItem.selectedImage = UIImage(named: "circleSearch")
        cartVC.tabBarItem.selectedImage = UIImage(named: "circleCart")
        fovoriteVC.tabBarItem.selectedImage = UIImage(named: "circleHeart")
        profileVC.tabBarItem.selectedImage = UIImage(named: "circleUser")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = self.view.frame.height/8.5
        tabBar.frame.origin.y =  view.frame.height - self.view.frame.height/8.5
    }

    func changeRadiusOfTabBar() {
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

