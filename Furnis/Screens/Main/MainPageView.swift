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
    
     var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(BannerTopCollectionViewCell.self, forCellWithReuseIdentifier: BannerTopCollectionViewCell.cellIdentifier)
        cv.register(FeaturedProductCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedProductCollectionViewCell.cellIdentifier)
         cv.register(FeaturedSectionHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: FeaturedSectionHeaderView.headerIdentifier)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNavigationView()
        setupConteinerView()
        setupCollectionView()
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
    
    private func setupCollectionView() {
        conteinrView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
