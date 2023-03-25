//
//  FeaturedProductsCollectionViewCell.swift
//  Furnis
//
//  Created by user1 on 16/03/23.
//

import UIKit
import SnapKit

final class FeaturedProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    static let cellIdentifier = "FeaturedProductCollectionViewCell"
    
    var cellData: FeaturedProductModel? {
        didSet {
            guard let cellData = cellData else { return }
            productImage.image = UIImage(named: cellData.image)
            productName.text = cellData.producttName
            oldPrice.text = "$" + cellData.oldPrice
            currentPrice.text = "$" + cellData.currentPirce
        }
    }
    
    private let containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    let productImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        return img
    }()
    
    private let productName: UILabel = {
        let l = UILabel()
        l.text = "Product Name"
        l.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        l.textColor = .label
        l.textAlignment = .left
        return l
    }()
    
    private let imageContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.productBackground
        v.layer.cornerRadius = 5
        v.clipsToBounds = true
        return v
    }()
    
    let heartButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "heart"), for: .normal)
        return b
    }()
    
    let saleButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "sale"), for: .normal)
        return b
    }()
    
    let plusButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "plus"), for: .normal)
        return b
    }()
    
    private let oldPrice: UILabel = {
        let l = UILabel()
        l.attributedText = "120".strikeThrough()
        l.font = UIFont.systemFont(ofSize: 16, weight: .light)
        l.textColor = #colorLiteral(red: 0.3999999762, green: 0.3999999762, blue: 0.3999999762, alpha: 1)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    private let currentPrice: UILabel = {
        let l = UILabel()
        l.text = "100"
        l.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        l.textColor = .label
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    private let pricesStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .fill
        
        return stack
    }()
    
    private let priceAndNameStackView: UIStackView = {
        let stack = UIStackView()
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
    
    private func setUpViews(){
        addSubview(containerView)
        containerView.addSubview(imageContainerView)
        imageContainerView.addSubview(productImage)
        imageContainerView.addSubview(heartButton)
        imageContainerView.addSubview(saleButton)
        imageContainerView.addSubview(plusButton)
        containerView.addSubview(priceAndNameStackView)
        priceAndNameStackView.addArrangedSubview(productName)
        priceAndNameStackView.addArrangedSubview(pricesStackView)
        pricesStackView.addArrangedSubview(oldPrice)
        pricesStackView.addArrangedSubview(currentPrice)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print(self.frame.size.width)
        }
    }
    
    private func setUpConstraints(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        heartButton.snp.makeConstraints { make in
            make.top.equalTo(imageContainerView.snp.top).offset(12)
            make.right.equalTo(imageContainerView.snp.right).offset(-12)
        }
        
        saleButton.snp.makeConstraints { make in
            make.left.equalTo(imageContainerView.snp.left).offset(6)
            make.bottom.equalTo(imageContainerView.snp.bottom).offset(-6)
        }
        
        plusButton.snp.makeConstraints { make in
            make.bottom.equalTo(imageContainerView.snp.bottom).offset(-6)
            make.right.equalTo(imageContainerView.snp.right).offset(-12)
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
