//
//  NavigationBar.swift
//  Furnis
//
//  Created by user1 on 14/03/23.
//

import UIKit

class NavigationBar: UIView {

    private let humburgerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "hamburger"), for: .normal)
        return button
    }()
    
    private let navigationTitle: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.numberOfLines = 0
        lable.textAlignment = .center
        lable.text = "text"
        return lable
    }()
    
    private let priceView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.main
        return view
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "100$"
        label.textColor = .white
        return label
    }()
    
    private let cartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "navCart"), for: .normal)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lineColor
        return view
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(humburgerButton)
        addSubview(navigationTitle)
        addSubview(cartButton)
        addSubview(stackView)
        stackView.addArrangedSubview(priceView)
        priceView.addSubview(priceLabel)
        stackView.addArrangedSubview(cartButton)
        addSubview(lineView)
    }
    
    private func setupConstraints() {
        humburgerButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalToSuperview().offset(20)
        }
        
        navigationTitle.snp.makeConstraints { make in
            make.top.equalTo(humburgerButton)
            make.centerX.equalTo(self.snp.centerX)
            
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(humburgerButton)
            make.right.equalTo(self.snp.right).offset(-12)
            make.right.equalToSuperview().offset(-15)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.edges.equalTo(priceView).offset(5)
        }
        
        lineView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(2)
        }

    }
}

extension NavigationBar {
    func setTitle(title: String) {
        navigationTitle.text = title
    }
    
    func addTargetForHamburger(target: Any, action: Selector) {
        humburgerButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func hideBackButton() {
        humburgerButton.isHidden = true
    }
}
