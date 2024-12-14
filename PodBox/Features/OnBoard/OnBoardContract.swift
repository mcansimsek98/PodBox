//
//  OnBoardContract.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 14.12.2024.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewOnBoardProtocol: AnyObject {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterOnBoardProtocol {
    var view: PresenterToViewOnBoardProtocol? { get set }
    var interactor: PresenterToInteractorOnBoardProtocol? { get set }
    var router: PresenterToRouterOnBoardProtocol? { get set }
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorOnBoardProtocol {
    var presenter: InteractorToPresenterOnBoardProtocol? { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterOnBoardProtocol {
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterOnBoardProtocol {
    
}
