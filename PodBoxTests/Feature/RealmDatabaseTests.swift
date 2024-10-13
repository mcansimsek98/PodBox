//
//  RealmDatabaseTests.swift
//  PodBoxTests
//
//  Created by Mehmet Can Şimşek on 8.10.2024.
//

import XCTest
import RealmSwift
@testable import PodBox

class TestObject: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    
    var id: String {
        return _id.stringValue
    }
}

final class RealmDatabaseTests: XCTestCase {
    var realmDatabase: RealmDataBase!

    override func setUp() {
        super.setUp()
        
        realmDatabase = RealmDataBase(
            in: "TestableRealm",
            object: [TestObject.self]
        )
    }
    
    func testAddItem() {
        let testObject = TestObject()
        testObject.name = "Mehmet Can"
        
        realmDatabase.add(model: testObject)
        
        let items = realmDatabase.items<TestObject>() as [TestObject]
        
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Mehmet Can")
    }
    
    func testDeleteItem() {
        let testObject = TestObject()
        testObject.name = "Mehmet Can"
        
        realmDatabase.add(model: testObject)
        
        var items = realmDatabase.items<TestObject>() as [TestObject]
        
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Mehmet Can")
        
        realmDatabase.delete(model: testObject)
        
        items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 0)
    }
    
    func testClearAll() {
        let testObject = TestObject()
        testObject.name = "Mehmet Can"
        
        realmDatabase.add(model: testObject)
        
        var items = realmDatabase.items<TestObject>() as [TestObject]
        
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Mehmet Can")
        
        realmDatabase.clearAll(model: TestObject.self)
        
        items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 0)
    }
    
    func testDeleteFromId() {
        let testObject = TestObject()
        testObject.name = "Mehmet Can"
        
        realmDatabase.add(model: testObject)
        
        var items = realmDatabase.items<TestObject>() as [TestObject]
        
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Mehmet Can")
        
        realmDatabase.deleteFromId(id: items.first!.id, model: TestObject.self)
        
        items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 0)
    }
}
