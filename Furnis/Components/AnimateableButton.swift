//
//  AnimateableButton.swift
//  Furnis
//
//  Created by Akhrorkhuja on 13/03/23.
//

import UIKit

final class AnimateableButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.addTarget(self, action: #selector(startButtonTouchedUpInside), for: [.touchDown])
        self.addTarget(self, action: #selector(startButtonTouchedDragExit), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func startButtonTouchedUpInside() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: [.curveEaseInOut]) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    @objc private func startButtonTouchedDragExit() {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: [.curveEaseInOut]) {
            self.transform = .identity
        }
    }
    
}
