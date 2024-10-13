//
//  NetworkManagerProtocol.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 8.10.2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<T: Decodable>(_ path: NetworkPathProvider,
                               method: NetworkMethod,
                               type: T.Type,
                               body: Encodable?,
                               parameters: [String: String]?) async -> Result<T?, Error>
    
}

extension NetworkManagerProtocol {
    func request<T: Decodable>(_ path: NetworkPathProvider,
                               method: NetworkMethod,
                               type: T.Type,
                               body: Encodable? = nil,
                               parameters: [String: String]? = nil) async -> Result<T?, Error> {
        return await request(path, method: method, type: type, body: body, parameters: parameters)
    }
}
