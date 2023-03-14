//
//  OnboardingViewController.swift
//  Furnis
//
//  Created by Akhrorkhuja on 13/03/23.
//

import UIKit

final class OnboardingViewController: UIViewController {

    private let presenter: OnboardingPresenter
    private let onboardingView: OnboardingView
    
    
    init(presenter: OnboardingPresenter = .init()) {
        self.presenter = presenter
        self.onboardingView = OnboardingView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = onboardingView
        onboardingView.startButtonTappedClosure = { [weak self] in
            let authVC = AuthViewController()
            self?.navigationController?.pushViewController(authVC, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setDelegate(onboardingViewDelegate: self)
    }

}

extension OnboardingViewController: OnboardingViewDelegate {
    
}
