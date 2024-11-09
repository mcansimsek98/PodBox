//
//  HomePresenter.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 30.09.2024.
//  
//

import Foundation

final class HomePresenter: ViewToPresenterHomeProtocol {

    // MARK: Properties
    weak var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?

    init(interactor: PresenterToInteractorHomeProtocol?, router: PresenterToRouterHomeProtocol?, view: PresenterToViewHomeProtocol?) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    
}
