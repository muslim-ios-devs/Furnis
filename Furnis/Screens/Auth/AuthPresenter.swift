//
//  AuthPresenter.swift
//  Furnis
//
//  Created by Akhrorkhuja on 14/03/23.
//

import Foundation

protocol AuthViewDelegate: AnyObject {
    
}

final class AuthPresenter {
    
    private weak var authViewDelegate: AuthViewDelegate?
    
    func setDelegate(authViewDelegate: AuthViewDelegate) {
        self.authViewDelegate = authViewDelegate
    }
    
}
