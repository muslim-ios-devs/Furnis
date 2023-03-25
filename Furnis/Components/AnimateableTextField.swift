//
//  AnimateableTextField.swift
//  Furnis
//
//  Created by Akhrorkhuja on 14/03/23.
//

import UIKit

private extension TimeInterval {
    static let animation250ms: TimeInterval = 0.25
}

private enum Constants {
    static let offset: CGFloat = 8
    static let placeholderSize: CGFloat = 12
}

final class AnimateableTextField: UITextField {
    
    // MARK: - Subviews
    private let label = UILabel()
    private let borderView = UIView()
    
    // MARK: - Private Properties
    private var scale: CGFloat {
        Constants.placeholderSize / fontSize
    }
    
    private var fontSize: CGFloat {
        font?.pointSize ?? 0
    }
    
    private var labelHeight: CGFloat {
        ceil(font?.withSize(Constants.placeholderSize).lineHeight ?? 0)
    }
    
    private var textHeight: CGFloat {
        ceil(font?.lineHeight ?? 0)
    }
    
    private var isEmpty: Bool {
        text?.isEmpty ?? true
    }
    
    private var textInsets: UIEdgeInsets {
        UIEdgeInsets(top: Constants.offset, left: 10, bottom: Constants.offset, right: 10)
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - UITextField
    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: textInsets.top + textHeight + textInsets.bottom)
    }
    
    override var placeholder: String? {
        didSet {
            guard let placeholder = placeholder else { return }
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.1
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 16),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor.main.withAlphaComponent(0.6)
            ]
            label.attributedText = NSAttributedString(
                string: placeholder.uppercased(), attributes: attributes
            )
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLabel(animated: false)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return .zero
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard !isFirstResponder else {
            return
        }
        
        label.transform = .identity
        label.sizeToFit()
        label.frame = CGRect(x: 10, y: 0, width: label.frame.width, height: label.frame.height)
        label.center.y = borderView.center.y
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        borderView.frame = bounds
        borderView.layer.borderColor = UIColor.main.withAlphaComponent(0.6).cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = 5
        borderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        borderView.isUserInteractionEnabled = false
        addSubview(borderView)
        
        label.backgroundColor = .white
        label.textColor = UIColor.main.withAlphaComponent(0.6)
        label.font = font
        label.text = placeholder
        label.isUserInteractionEnabled = false
        addSubview(label)
        
        addTarget(self, action: #selector(handleEditing), for: .allEditingEvents)
    }
    
    @objc private func handleEditing() {
        updateLabel()
        updateBorder()
    }
    
    private func updateBorder() {
        let borderColor: UIColor = isFirstResponder ? .main : .main.withAlphaComponent(0.6)
        UIView.animate(withDuration: .animation250ms) {
            self.borderView.layer.borderColor = borderColor.cgColor
        }
    }
    
    private func updateLabel(animated: Bool = true) {
        let isActive = isFirstResponder || !isEmpty
        
        let offsetX = -label.bounds.width * (1 - scale) / 2
        let offsetY = -label.bounds.height * (1 - scale) / 2
        
        let transform = CGAffineTransform(translationX: offsetX, y: offsetY - labelHeight - Constants.offset)
            .scaledBy(x: scale, y: scale)
        
        guard animated else {
            label.transform = isActive ? transform : .identity
            return
        }
        
        UIView.animate(withDuration: .animation250ms) {
            self.label.transform = isActive ? transform : .identity
        }
    }
}
