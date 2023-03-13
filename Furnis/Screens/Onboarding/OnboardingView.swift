//
//  OnboardingView.swift
//  Furnis
//
//  Created by Akhrorkhuja on 13/03/23.
//

import UIKit
import SnapKit

final class OnboardingView: UIView {

    private let descriptions: [String] = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur commodo.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam feugiat."
    ]
    
    private var selectedDescriptionIndex: Int = 0
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onboarding-background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.makeAttributedText(
            for: "Door To Door Delivery!", lineHeight: 1.1,
            fontSize: 38, fontWeight: .bold
        )
        label.textColor = .main
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondary
        label.isUserInteractionEnabled = true
        return label
    }()

    private let sliderControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPageIndicatorTintColor = .main
        control.pageIndicatorTintColor = .white
        control.numberOfPages = 3
        control.allowsContinuousInteraction = false
        control.backgroundStyle = .minimal
        control.addTarget(self, action: #selector(sliderControlChanged), for: .valueChanged)
        return control
    }()
    
    private let startButton: AnimateableButton = {
        let button = AnimateableButton()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .semibold),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.white
        ]
        let attributedString = NSAttributedString(
            string: "GET STARTED", attributes: attributes
        )
        button.setAttributedTitle(attributedString, for: .normal)
        button.backgroundColor = .main
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundImage()
        setupLogoImage()
        setupTitleLabel()
        setupDescriptionLabel()
        setupSliderControl()
        setupStartButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundImage() {
        addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupLogoImage() {
        addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(100)
            make.width.equalTo(60)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.makeAttributedText(
            for: descriptions[selectedDescriptionIndex], lineHeight: 1.2,
            fontSize: 16, fontWeight: .regular
        )
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeftGesture.direction = .left
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRightGesture.direction = .right
        descriptionLabel.addGestureRecognizer(swipeLeftGesture)
        descriptionLabel.addGestureRecognizer(swipeRightGesture)
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func setupSliderControl() {
        addSubview(sliderControl)
        sliderControl.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(28)
            make.left.equalToSuperview().inset(16)
        }
    }
    
    private func setupStartButton() {
        addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(26)
        }
    }
    
    @objc private func swipedLeft() {
        if selectedDescriptionIndex + 1 > descriptions.count - 1 {
            selectedDescriptionIndex = 0
        } else {
            selectedDescriptionIndex += 1
        }
        updateDescription()
    }
    
    @objc private func swipedRight() {
        if selectedDescriptionIndex - 1 < 0 {
            selectedDescriptionIndex = descriptions.count - 1
        } else {
            selectedDescriptionIndex -= 1
        }
        updateDescription()
    }
    
    @objc private func sliderControlChanged(_ sender: UIPageControl) {
        UIView.transition(with: descriptionLabel, duration: 0.3, options: [.transitionCrossDissolve]) {
            self.selectedDescriptionIndex = sender.currentPage
            self.descriptionLabel.text = self.descriptions[sender.currentPage]
        }
    }
    
    
    
    private func updateDescription() {
        UIView.transition(with: descriptionLabel, duration: 0.3, options: [.transitionCrossDissolve]) {
            self.descriptionLabel.text = self.descriptions[self.selectedDescriptionIndex]
            self.sliderControl.currentPage = self.selectedDescriptionIndex
        }
    }
}
