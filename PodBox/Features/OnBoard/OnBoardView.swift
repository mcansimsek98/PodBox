//
//  OnBoardView.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 14.12.2024.
//  
//

import UIKit

final class OnBoardView: BaseView {
    private lazy var logoImage: UIImageView = {
        let img = UIImageView(image: .splash)
        img.contentMode = .scaleAspectFit
        img.dynamicSize(.init(width: 250, height: 350))
        return img
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .podboxBlack
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.text = "Welcome to PodBox!"
        label.alpha = 0
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.addArrangedSubview(logoImage)
        return stackView
    }()
    
    override func setupView() {
        super.setupView()
        addSubviews(stackView)
        configureUIAnimated()
    }
    
    override func setupConstraints() {
        stackView.centerInSuperview(padding: .init(top: -65, left: 0, bottom: 0, right: 0))
    }
    
    private func configureUIAnimated() {
        runOnMain(with: 3) {
            self.stackView.addArrangedSubview(self.welcomeLabel)
            UIView.animate(withDuration: 0.3) {
                self.welcomeLabel.alpha = 1
            }
        }
    }
}
