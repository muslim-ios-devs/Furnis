//
//  OnboardingViewController.swift
//  Furnis
//
//  Created by Akhrorkhuja on 13/03/23.
//

import UIKit

final class OnboardingViewController: UIViewController {

    private let presenter: OnboardingPresenter
    
    init(presenter: OnboardingPresenter = .init()) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        presenter.setDelegate(onboardingViewDelegate: self)
    }

}

extension OnboardingViewController: OnboardingViewDelegate {
    
}
