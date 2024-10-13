//
//  NetworkMethod.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 1.10.2024.
//

import Foundation
import Alamofire

enum NetworkMethod {
    case get
    case post
    case put
    case delete
}

extension NetworkMethod {
    var method: HTTPMethod {
        switch self {
        case .get: return .get
        case .post: return .post
        case .put: return .put
        case .delete: return .delete
        }
    }
}
