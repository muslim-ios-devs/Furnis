//
//  AppCoordinator.swift
//  Furnis
//
//  Created by Akhrorkhuja on 13/03/23.
//

import UIKit

final class AppCoordinator: NSObject {
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init()
        startScreenFlow()
    }
    
    private func startScreenFlow() {
        let onboardingVC = OnboardingViewController(presenter: OnboardingPresenter())
        let navigationController = UINavigationController(rootViewController: onboardingVC)
//        window.rootViewController = navigationController
        window.rootViewController = TabBarController()
        window.makeKeyAndVisible()
    }
}
