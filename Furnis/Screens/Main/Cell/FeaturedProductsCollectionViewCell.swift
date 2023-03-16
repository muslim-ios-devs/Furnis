//
//  FeaturedProductsCollectionViewCell.swift
//  Furnis
//
//  Created by user1 on 16/03/23.
//

import UIKit
import SnapKit

class FeaturedProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    static let cellIdentifier = "FeaturedProductCollectionViewCell"
    
    var cellData: FeaturedProductModel? {
        didSet {
            guard let cellData = cellData else { return }
            productImage.image = UIImage(named: cellData.image)
            productName.text = cellData.producttName
            oldPrice.text = cellData.oldPrice
            currentPrice.text = cellData.currentPirce
        }
    }
    let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        
        return v
    }()
    
    let productImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        return img
    }()
    
    let productName: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Product Name"
        l.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        l.textColor = .label
        l.textAlignment = .left
        return l
    }()
    
    let imageContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.productBackground
        v.layer.cornerRadius = 5
        v.clipsToBounds = true
        return v
    }()
    
    let oldPrice: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "120"
        l.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        l.textColor = .label
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let currentPrice: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "100"
        l.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        l.textColor = .label
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    private let pricesStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .fill
        
        return stack
    }()
    
    private let priceAndNameStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fill
        
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
        addSubview(containerView)
        containerView.addSubview(imageContainerView)
        imageContainerView.addSubview(productImage)
        containerView.addSubview(priceAndNameStackView)
        priceAndNameStackView.addArrangedSubview(productName)
        priceAndNameStackView.addArrangedSubview(pricesStackView)
        pricesStackView.addArrangedSubview(oldPrice)
        pricesStackView.addArrangedSubview(currentPrice)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print(self.frame.size.width)
        }
    }
    
    func setUpConstraints(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        productImage.snp.makeConstraints { make in
            make.top.equalTo(imageContainerView.snp.top).offset(12)
            make.bottom.equalTo(imageContainerView.snp.bottom).offset(12)
            make.left.equalTo(imageContainerView.snp.left).offset(12)
            make.right.equalTo(imageContainerView.snp.right).offset(-12)
        }
        
        priceAndNameStackView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(8)
        }
    }
    
}
