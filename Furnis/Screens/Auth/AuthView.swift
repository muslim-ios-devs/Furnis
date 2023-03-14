//
//  AuthView.swift
//  Furnis
//
//  Created by Akhrorkhuja on 14/03/23.
//

import UIKit
import SnapKit

final class AuthView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.makeAttributedText(
            for: "Sign Up", lineHeight: 1.1,
            fontSize: 35, fontWeight: .bold
        )
        return label
    }()
    
    private let nameField: AnimateableTextField = {
        let field = AnimateableTextField()
        field.placeholder = "Name"
        return field
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupTitleLabel()
        setupNameField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(65)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func setupNameField() {
        addSubview(nameField)
        nameField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(34)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
}
