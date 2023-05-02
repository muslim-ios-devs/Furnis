//
//  AuthView.swift
//  Furnis
//
//  Created by Akhrorkhuja on 14/03/23.
//

import UIKit
import SnapKit

final class AuthView: UIView {

    var signInTextTappedClosure: (() -> Void)?
    var signUpButtonTappedClosure: (() -> Void)?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.makeAttributedText(
            for: "Sign Up", lineHeight: 1.1,
            fontSize: 35, fontWeight: .bold
        )
        return label
    }()
    
    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 26
        return stack
    }()
    
    private let nameField: AnimateableTextField = {
        let field = AnimateableTextField()
        field.placeholder = "Name"
        field.fieldType = .email
        field.textContentType = .name
        field.keyboardType = .asciiCapable
        field.autocorrectionType = .no
        return field
    }()
    
    private let emailField: AnimateableTextField = {
        let field = AnimateableTextField()
        field.placeholder = "Email"
        field.fieldType = .email
        field.textContentType = .username
        field.keyboardType = .emailAddress
        field.autocorrectionType = .no
        return field
    }()
    
    private let passwordField: AnimateableTextField = {
        let field = AnimateableTextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.fieldType = .secure
        field.textContentType = .newPassword
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        return field
    }()
    
    private let confirmPasswordField: AnimateableTextField = {
        let field = AnimateableTextField()
        field.placeholder = "Confirm password"
        field.isSecureTextEntry = true
        field.fieldType = .secure
        field.textContentType = .newPassword
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        return field
    }()
    
    private let signUpButton: AnimateableButton = {
        let button = AnimateableButton()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .semibold),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.white,
            .kern: 1.0
        ]
        let attributedString = NSAttributedString(
            string: "SIGN UP", attributes: attributes
        )
        button.setAttributedTitle(attributedString, for: .normal)
        button.backgroundColor = .main
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        let mainAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.main.withAlphaComponent(0.7),
        ]
        let attributedText = NSMutableAttributedString(
            string: "Already have an account?", attributes: mainAttributes
        )
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        let secondaryAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.main,
            .font: UIFont.systemFont(ofSize: 16, weight: .medium),
            .kern: 1.0,
            .paragraphStyle: paragraphStyle
        ]
        let clickableAttributedText = NSAttributedString(
            string: " Sign in.", attributes: secondaryAttributes
        )
        attributedText.append(clickableAttributedText)
        label.attributedText = attributedText
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupScrollView()
        setupTitleLabel()
        setupFormStack()
        setupNameField()
        setupEmailField()
        setupPasswordField()
        setupConfirmPasswordField()
        setupSignUpButton()
        setupSignInLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AuthView {
    @objc private func signInLabelTapped(_ sender: UITapGestureRecognizer) {
        print("before:signInTapped")
        guard sender.didTapAttributedString(" Sign in.", in: signInLabel) else { return }
        print("after:signInTapped")
        signInTextTappedClosure?()
    }
}

extension AuthView {
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(self)
        }
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(65)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func setupFormStack() {
        contentView.addSubview(formStack)
        formStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(34)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func setupNameField() {
        formStack.addArrangedSubview(nameField)
        nameField.delegate = self
        nameField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    private func setupEmailField() {
        formStack.addArrangedSubview(emailField)
        emailField.delegate = self
        emailField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    private func setupPasswordField() {
        formStack.addArrangedSubview(passwordField)
        passwordField.delegate = self
        passwordField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    private func setupConfirmPasswordField() {
        formStack.addArrangedSubview(confirmPasswordField)
        confirmPasswordField.delegate = self
        confirmPasswordField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    private func setupSignUpButton() {
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        contentView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(formStack.snp.bottom).offset(25)
        }
    }
    
    private func setupSignInLabel() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(signInLabelTapped))
        signInLabel.addGestureRecognizer(tapGesture)
        contentView.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(contentView)
        }
    }
}

extension AuthView {
    @objc private func signUpButtonTapped() {
        signUpButtonTappedClosure?()
    }
}

extension AuthView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var point = textField.frame.origin
        point.y /= 2
        scrollView.setContentOffset(point, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(.zero, animated: true)
    }
}
