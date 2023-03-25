//
//  SectionDecorationView.swift
//  Furnis
//
//  Created by user1 on 16/03/23.
//

import UIKit

class SectionDecorationView: UICollectionReusableView {
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
//        self.backgroundColor = .lightGray.withAlphaComponent(0.2)
//        layer.cornerRadius = 20
    }
    
}
