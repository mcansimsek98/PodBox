//
//  TestVbRouter.swift
//  PodcastApp
//
//  Created by vb10 on 1.02.2024.
//
//

import UIKit

final class  OnBoardRouter: PresenterToRouterOnBoardProtocol {
    private let navigation: NavigationDelegate
    
    init(navigation: NavigationDelegate) {
        self.navigation = navigation
    }
    
    // MARK: Static methods
    static func create() -> OnBoardVC {
        let vc = OnBoardVC()
        let interactor = OnBoardInteractor()
        let router = OnBoardRouter(navigation: vc)
        
        let presenter: ViewToPresenterOnBoardProtocol & InteractorToPresenterOnBoardProtocol = OnBoardPresenter(
            interactor: interactor, router: router, view: vc)
        
        vc.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}
