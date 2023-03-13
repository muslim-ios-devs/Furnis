//
//  UILabel+Extension.swift
//  Furnis
//
//  Created by Akhrorkhuja on 13/03/23.
//

import UIKit

extension UILabel {
    func makeAttributedText(for text: String, lineHeight: CGFloat, fontSize: CGFloat, fontWeight: UIFont.Weight) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.lineBreakMode = .byWordWrapping
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        ]
        let attributedString = NSAttributedString(
            string: text, attributes: attributes
        )
        self.attributedText = attributedString
        self.numberOfLines = 0
    }
}
