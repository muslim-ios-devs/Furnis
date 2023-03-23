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
        mainPageView.collectionView.dataSource = self
        mainPageView.collectionView.delegate = self
        configureCompositionalLayout()
    }
}

//collection view buttons
extension MainPageController {
    
    //FeaturedSectionHeaderView button
    @objc private func viewAllTapped() {
        print("vieall tapped")
    }
    
    //FeaturedProductCollectionViewCell buttons
    @objc private func heartTapped() {
        print("heartTapped tapped")
    }
    
    @objc private func saleTapped() {
        print("saleTapped tapped")
    }
    
    @objc private func plusTapped() {
        print("plusTapped tapped")
    }
}

extension MainPageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return bannerTopData.count
        default:
            return featuredProductData.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerTopCollectionViewCell.cellIdentifier, for: indexPath) as? BannerTopCollectionViewCell else {fatalError("Unable deque cell...")}
             cell.cellData = bannerTopData[indexPath.row]
             return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedProductCollectionViewCell.cellIdentifier, for: indexPath) as? FeaturedProductCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = featuredProductData[indexPath.row]
            cell.saleButton.addTarget(self, action: #selector(saleTapped), for: .touchUpInside)
            cell.heartButton.addTarget(self, action: #selector(heartTapped), for: .touchUpInside)
            cell.plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
            
             return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "Header" {
            
            switch indexPath.section {
            case 0 :
//                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FilterHeaderView.headerIdentifier, for: indexPath) as! FilterHeaderView
//                header.delegate = self
//                return header
                print("ss")
            default :
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FeaturedSectionHeaderView.headerIdentifier, for: indexPath) as! FeaturedSectionHeaderView
                header.viewAllButton.addTarget(self, action: #selector(viewAllTapped), for: .touchUpInside)
                return header
            }
            
        }
        return UICollectionReusableView()

    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? BannerTopCollectionViewCell {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                cell.bannerImage.transform = .init(scaleX: 0.95, y: 0.95)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? BannerTopCollectionViewCell {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                cell.bannerImage.transform = .identity
            }
        }
    }
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return AppLayouts.shared.topBannerSection()
           
            default:
                return AppLayouts.shared.featuredSectionLayout()
            }
        }
        layout.register(SectionDecorationView.self, forDecorationViewOfKind: "SectionBackground")
        mainPageView.collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension MainPageController: MainPagePresenterDelegate {
    
}
