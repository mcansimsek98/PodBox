//
//  HomeContract.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 30.09.2024.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol: AnyObject {
    
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    var presenter: InteractorToPresenterHomeProtocol? { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    
}
