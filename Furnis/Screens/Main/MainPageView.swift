//
//  MainPageView.swift
//  Furnis
//
//  Created by user1 on 14/03/23.
//

import UIKit
import SnapKit

class MainPageView: UIView {
    
    private let navigationView: NavigationBar = {
        let view = NavigationBar()
        view.setTitle(title: "Main Test")
        return view
    }()
    
    private let conteinrView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNavigationView()
        setupConteinerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigationView() {
        addSubview(navigationView)
        navigationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-10)
            make.height.equalTo(120)
            make.left.right.equalToSuperview()
        }
    }
    
    private func setupConteinerView() {
        addSubview(conteinrView)
        conteinrView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    
}
