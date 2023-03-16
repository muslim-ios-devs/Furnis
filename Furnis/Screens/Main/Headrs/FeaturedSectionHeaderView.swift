//
//  FeaturedSectionHeaderView.swift
//  Furnis
//
//  Created by user1 on 16/03/23.
//

import UIKit

class FeaturedSectionHeaderView: UICollectionReusableView {
    
    // MARK: PROPERTIES -
    static let headerIdentifier = "FeaturedSectionHeaderView"

    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .label
        l.text = "Featured"
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.textAlignment = .right
        return l
    }()
    
    let viewAllButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("View all >", for: .normal)
        b.tintColor = .label
        b.setTitleColor(UIColor.secondary, for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        b.addTarget(self, action: #selector(viewAllTapped), for: .touchUpInside)
        return b
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.axis = .horizontal
//        stack.spacing = 4
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        backgroundColor = .clear
        addSubview(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(viewAllButton)
    }
    
    func setUpConstraints(){
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func viewAllTapped() {
        print("vieall tapped")
    }
}
