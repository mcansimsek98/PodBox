//
//  UIFont+Extension.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 9.11.2024.
//

import Foundation
import UIKit

extension UIFont {
    
    /// Computed property to retrieve a bold version of the current font
    var bolded: UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}

