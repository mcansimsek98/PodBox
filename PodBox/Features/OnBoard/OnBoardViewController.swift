//
//  OnBoardViewController.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 14.12.2024.
//  
//

import UIKit

final class OnBoardVC: BaseViewController<OnBoardView> {
    // MARK: - Properties
    var presenter: ViewToPresenterOnBoardProtocol?

    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = OnBoardView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.view = nil
    }
}

extension OnBoardVC: PresenterToViewOnBoardProtocol{
    // TODO: Implement View Output Methods
}
