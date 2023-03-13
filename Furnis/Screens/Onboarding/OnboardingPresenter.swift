//
//  OnboardingPresenter.swift
//  Furnis
//
//  Created by Akhrorkhuja on 13/03/23.
//

import Foundation

protocol OnboardingViewDelegate: AnyObject {
    
}

final class OnboardingPresenter {
    
    private weak var onboardingViewDelegate: OnboardingViewDelegate?
    
    
    func setDelegate(onboardingViewDelegate: OnboardingViewDelegate) {
        self.onboardingViewDelegate = onboardingViewDelegate
    }
    
}
