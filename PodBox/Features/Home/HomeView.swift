//
//  HomeView.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 30.09.2024.
//  
//

import UIKit

final class HomeView: BaseView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "VIPER Template"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        super.setupView()
        addSubviews(titleLabel)
    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
}
