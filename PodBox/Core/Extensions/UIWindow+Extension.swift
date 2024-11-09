//
//  UIWindow+Extension.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 9.11.2024.
//

import Foundation
import UIKit

extension UIWindow {
    /// Retrieves the current key window from the application's connected scenes
    static var current: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first(where: \.isKeyWindow)
    }
}
