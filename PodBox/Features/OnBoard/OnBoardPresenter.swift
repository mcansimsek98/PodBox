//
//  OnBoardPresenter.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 14.12.2024.
//  
//

import Foundation

final class OnBoardPresenter: ViewToPresenterOnBoardProtocol {

    // MARK: Properties
    weak var view: PresenterToViewOnBoardProtocol?
    var interactor: PresenterToInteractorOnBoardProtocol?
    var router: PresenterToRouterOnBoardProtocol?

    init(interactor: PresenterToInteractorOnBoardProtocol?, router: PresenterToRouterOnBoardProtocol?, view: PresenterToViewOnBoardProtocol?) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

extension OnBoardPresenter: InteractorToPresenterOnBoardProtocol {
    
}
