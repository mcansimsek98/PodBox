//
//  HomeViewController.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 30.09.2024.
//  
//

import UIKit

final class HomeVC: BaseViewController<HomeView> {
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = HomeView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.view = nil
    }
}

extension HomeVC: PresenterToViewHomeProtocol{
    // TODO: Implement View Output Methods
}
