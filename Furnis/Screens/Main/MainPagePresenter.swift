//
//  MainPagePresenter.swift
//  Furnis
//
//  Created by user1 on 14/03/23.
//

import Foundation

protocol MainPagePresenterDelegate: AnyObject {
    
}

final class MainPagePresenter {
    
    private weak var mainPageViewDelegate: MainPagePresenterDelegate?
    
    
    func setDelegate(mainPageViewDelegate: MainPagePresenterDelegate) {
        self.mainPageViewDelegate = mainPageViewDelegate
    }
    
}
