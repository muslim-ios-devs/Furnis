//
//  MainPageController.swift
//  Furnis
//
//  Created by user1 on 14/03/23.
//

import Foundation
import UIKit

final class MainPageController: UIViewController {
    
    private let presenter: MainPagePresenter
    private let mainPageView: MainPageView
    
    
    init(presenter: MainPagePresenter = .init()) {
        self.presenter = presenter
        self.mainPageView = MainPageView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setDelegate(mainPageViewDelegate: self)
    }
}

extension MainPageController: MainPagePresenterDelegate {
    
}
