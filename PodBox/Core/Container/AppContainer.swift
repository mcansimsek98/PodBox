//
//  AppContainer.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 6.11.2024.
//

import Foundation
import Swinject

final class AppContainer {
    static let shared = AppContainer()
    private let container: Container
    private let logger: OSLogger
    
    private init() {
        container = Container()
        logger = OSLogger()
        registerDependencies()
    }
    
    ///Network manager object
    var networkManager: NetworkManager {
        guard let instance = container.resolve(NetworkManager.self) else {
            logger.addLog("NetworkManager is not registered")
            fatalError("NetworkManager is not registered")
        }
        
        return instance
    }
    
    ///Database manager object
    var database: RealmDataBase {
        guard let instance = container.resolve(RealmDataBase.self) else {
            logger.addLog("RealmDataBase is not registered")
            fatalError("RealmDataBase is not registered")
        }
        
        return instance
    }
    
    ///DataPublisher
    var dataPublisher: DataPublisher {
        guard let instance = container.resolve(DataPublisher.self) else{
            logger.addLog("DataPublisher is not registered")
            fatalError("DataPublisher is not registered")
        }
        
        return instance
    }
    
    ///Register for global object with this method
    func registerDependencies() {
        logger.addLog(.info, "Registered dependencies")
        
        container.register(NetworkManager.self) { _ in NetworkManager(config: NetworkConfiguration(baseURL: "")) }
        container.register(RealmDataBase.self) { _ in RealmDataBase() }
        container.register(DataPublisher.self) { _ in DataPublisher() }
    }
}
