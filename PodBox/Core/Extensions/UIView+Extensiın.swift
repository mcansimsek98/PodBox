//
//  UIView+Extensiın.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 14.12.2024.
//

import UIKit

//MARK: addSubviews
public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

// MARK: constraint
extension UIView {
    /// A method to easily add a subview and apply specific constraints using width and height ratios.
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        padding: UIEdgeInsets = .zero,
        widthRatio: CGFloat? = nil,
        heightRatio: CGFloat? = nil
    ) {
        let screen = UIScreen.main.bounds
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if let widthRatio = widthRatio {
            widthAnchor.constraint(equalToConstant: screen.width * widthRatio).isActive = true
        }
        if let heightRatio = heightRatio {
            heightAnchor.constraint(equalToConstant: screen.height * heightRatio).isActive = true
        }
    }
    
    /// A method to easily add a subview and apply specific constraints using CGSize.
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero
    ) {
        let screen = UIScreen.main.bounds
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if size.width > 0 {
            let ratio = size.width / screen.width
            widthAnchor.constraint(equalToConstant: screen.width * ratio).isActive = true
        }
        if size.height > 0 {
            let ratio = size.height / screen.height
            heightAnchor.constraint(equalToConstant: screen.height * ratio).isActive = true
        }
    }
    
    /// Easily centers a view within its superview while applying width and height ratios relative to the screen size.
    func centerInSuperview(
        widthRatio: CGFloat? = nil,
        heightRatio: CGFloat? = nil,
        padding: UIEdgeInsets = .zero
    ) {
        let screen = UIScreen.main.bounds
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterX = superview?.centerXAnchor {
            let padding = padding.left != 0 ? padding.left : padding.right
            centerXAnchor.constraint(equalTo: superviewCenterX, constant: padding).isActive = true
        }
        if let superviewCenterY = superview?.centerYAnchor {
            let padding = padding.top != 0 ? padding.top : padding.bottom
            centerYAnchor.constraint(equalTo: superviewCenterY, constant: padding).isActive = true
        }
        if let widthRatio = widthRatio {
            widthAnchor.constraint(equalToConstant: screen.width * widthRatio).isActive = true
        }
        if let heightRatio = heightRatio {
            heightAnchor.constraint(equalToConstant: screen.height * heightRatio).isActive = true
        }
    }
    
    /// Easily centers a view within its superview using a specified CGSize for width and height, scaled dynamically based on the screen size.
    func centerInSuperview(
        with size: CGSize = .zero,
        padding: UIEdgeInsets = .zero
    ) {
        let screen = UIScreen.main.bounds
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterX = superview?.centerXAnchor {
            let padding = padding.left != 0 ? padding.left : padding.right
            centerXAnchor.constraint(equalTo: superviewCenterX, constant: padding).isActive = true
        }
        if let superviewCenterY = superview?.centerYAnchor {
            let padding = padding.top != 0 ? padding.top : padding.bottom
            centerYAnchor.constraint(equalTo: superviewCenterY, constant: padding).isActive = true
        }
        if size.width > 0 {
            let ratio = size.width / screen.width
            widthAnchor.constraint(equalToConstant: screen.width * ratio).isActive = true
        }
        if size.height > 0 {
            let ratio = size.height / screen.height
            heightAnchor.constraint(equalToConstant: screen.height * ratio).isActive = true
        }
    }
    
    func dynamicSize(_ size: CGSize = CGSize(width: 10, height: 10)) {
        let screen = UIScreen.main.bounds
        let widthRatio = size.width / screen.width
        let heightRatio = size.height / screen.height
        
        widthAnchor.constraint(equalToConstant: screen.width * widthRatio).isActive = true
        heightAnchor.constraint(equalToConstant: screen.height * heightRatio).isActive = true
    }
}
