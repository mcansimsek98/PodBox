//
//  NetworkManager.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 1.10.2024.
//

import Foundation
import Alamofire

final class NetworkManager: NetworkManagerProtocol {
    private let congif: NetworkConfiguration
    private let decoder: JSONDecoder
    
    init (config: NetworkConfiguration, decoder: JSONDecoder = JSONDecoder()) {
        self.congif = config
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .iso8601
    }
    
    ///
    /// This function sends an HTTP request based on the provided parameters and returns the result as the specified type.
    /// - Parameters:
    ///   - path: A `NetworkPathProvider` that provides the URL path for the request. It defines the API endpoint.
    ///   - method: The HTTP method for the request, represented by `NetworkMethod`, such as `.get`, `.post`, etc.
    ///   - type: The type of the response expected, which must conform to `Decodable`.
    ///   - body: The request body, which is optional and must conform to `Encodable`.
    ///   - parameters: Optional URL parameters to be sent with the request, represented as a dictionary of strings.
    /// - Returns: An asynchronous result that either contains the decoded response of type `T` or an `Error`.
    func request<T: Decodable>(_ path: NetworkPathProvider,
                                   method: NetworkMethod,
                                   type: T.Type,
                                   body: Encodable? = nil,
                                   parameters: [String: String]? = nil) async -> Result<T?, Error> {
        
        guard let url = URL(string: congif.baseURL + path.value) else {
            return .failure(NetworkError.invalidURL)
        }
        
        var request: DataRequest
        
        if let body = body {
            request = AF.request(url, method: method.method, parameters: body, encoder: JSONParameterEncoder.default)
        } else if let parameters = parameters {
            request = AF.request(url, method: method.method, parameters: parameters)
        } else {
            request = AF.request(url, method: method.method)
        }
        
        let response = await request.validate().serializingDecodable(T.self, decoder: decoder).response
        
        if let error = response.error {
            return .failure(error)
        }
        
        guard let value = response.value else {
            return .failure(NetworkError.invalidResponse)
        }
        return .success(value)
    }
}
