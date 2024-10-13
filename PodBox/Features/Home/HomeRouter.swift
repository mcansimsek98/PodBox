//
//  TestVbRouter.swift
//  PodcastApp
//
//  Created by vb10 on 1.02.2024.
//
//

import UIKit

final class  HomeRouter: PresenterToRouterHomeProtocol {
    private let navigation: NavigationDelegate
    
    init(navigation: NavigationDelegate) {
        self.navigation = navigation
    }
    
    // MARK: Static methods
    static func create() -> HomeVC {
        let vc = HomeVC()
        let interactor = HomeInteractor()
        let router = HomeRouter(navigation: vc)
        
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter(
            interactor: interactor, router: router, view: vc)
        
        vc.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}
