//
//  NetworkPath.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 1.10.2024.
//

import Foundation

enum NetworkPath: String, NetworkPathProvider {
    var value: String { self.rawValue }

    case login = "/login"
    
}

protocol NetworkPathProvider {
    var value: String { get }
}
