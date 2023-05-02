//
//  AuthViewController.swift
//  Furnis
//
//  Created by Akhrorkhuja on 14/03/23.
//

import UIKit

final class AuthViewController: UIViewController {

    private let presenter: AuthPresenter
    private let authView: AuthView
    
    init(presenter: AuthPresenter = .init()) {
        self.presenter = presenter
        self.authView = AuthView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = authView
        authView.signInTextTappedClosure = { [weak self] in
            let alertVC = UIAlertController(title: "sign in", message: nil, preferredStyle: .alert)
            self?.present(alertVC, animated: true) {
                self?.dismiss(animated: true)                
            }
        }
        authView.signUpButtonTappedClosure = { [weak self] in
            let mainVC = MainPageController()
            self?.navigationController?.setViewControllers([mainVC], animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setDelegate(authViewDelegate: self)
    }

}

extension AuthViewController: AuthViewDelegate {
    
}
