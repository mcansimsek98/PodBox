//
//  RealmDataBase.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 8.10.2024.
//

import RealmSwift

final class RealmDataBase {
    private let realm: Realm
    
    init(in memoryIdentifier: String? = nil, object: [Object.Type]? = nil) {
        let confg = Realm.Configuration(inMemoryIdentifier: memoryIdentifier, deleteRealmIfMigrationNeeded: true, objectTypes: object)
        
        guard let realm = try? Realm(configuration: confg) else {
            fatalError("Realm could not be initialized")
        }
        self.realm = realm
    }
}

extension RealmDataBase: LocalDatabaseProtocol {
    func add<T>(model: T) where T : Object {
        try? realm.write {
            realm.add(model)
        }
    }
    
    func clearAll<T>(model: T.Type) where T : Object {
        try? realm.write {
            realm.deleteAll()
        }
    }
    
    func items<T>() -> [T] where T : Object {
        return realm.objects(T.self).map { $0 }
    }
    
    func delete<T>(model: T) where T : Object {
        try? realm.write {
            realm.delete(model)
        }
    }
    
    func deleteFromId<T>(id: String, model: T.Type) where T : Object {
        guard let objectId = try? ObjectId(string: id) else { return }
        
        let item = realm.objects(model.self).filter("_id == %@", objectId)
        
        try? realm.write {
            realm.delete(item)
        }
    }
    
    func listenChanges<T>(model: T.Type, closure: @escaping (LocalDatabaseUpdate, [Int]) -> Void) where T : Object {
        let result = realm.objects(model.self)
        let token = result.observe { changes in
            switch changes {
            case .update(_, let deletions, let insertions, let modifications):
                if !deletions.isEmpty {
                    let ids = deletions.map(\.self)
                    closure(.delete, ids)
                }
                
                if !insertions.isEmpty {
                    let ids = insertions.map(\.self)
                    closure(.insert, ids)
                }
                
                if !modifications.isEmpty {
                    let ids = modifications.map(\.self)
                    closure(.modify, ids)
                }
            default:
                break
            }
        }
    }
}
