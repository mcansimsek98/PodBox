//
//  BaseView.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 30.09.2024.
//

import UIKit

class BaseView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {}
    
    func setupConstraints() {}
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
