//
//  NetworkManagerDemoTest.swift
//  PodBoxTests
//
//  Created by Mehmet Can Şimşek on 8.10.2024.
//

import XCTest

@testable import PodBox
final class NetworkManagerDemoTest: XCTestCase {
    var netowrkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        netowrkManager = NetworkManager(config: NetworkConfiguration(baseURL: "https://openwhyd.org/"))
    }
    
    func testWithMusicResponse() async {
        let result = await netowrkManager.request(MockPath.music, method: .get, type: [MusicResponse].self)
        
        switch result {
        case .success(let response):
            XCTAssertNotNil(response)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
}

// MARK: - MusicResponse
struct MusicResponse: Codable {
    let uNm: String?
    let name: String?
}

enum MockPath: String, NetworkPathProvider {
    case music = "adrien?format=json"
    
    var value: String {
        self.rawValue
    }
}
