//
//  LocalDatabase.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 8.10.2024.
//

import RealmSwift

enum LocalDatabaseUpdate {
    case delete
    case insert
    case modify
}

protocol LocalDatabaseProtocol {
    func add<T: Object>(model: T)
    func clearAll<T: Object>(model: T.Type)
    func items<T: Object>() -> [T]
    func delete<T: Object>(model: T)
    func deleteFromId<T: Object>(id: String, model: T.Type)
    
    func listenChanges<T: Object>(model: T.Type, closure: @escaping (LocalDatabaseUpdate, [Int]) -> Void)
}
