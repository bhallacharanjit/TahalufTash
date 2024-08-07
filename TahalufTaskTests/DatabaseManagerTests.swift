//
//  DatabaseManagerTests.swift
//  TahalufTaskTests
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation
import XCTest
import RealmSwift
@testable import TahalufTask

class DatabaseManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Use an in-memory Realm for testing
        var config = Realm.Configuration(inMemoryIdentifier: self.name)
        config.schemaVersion = 1
        Realm.Configuration.defaultConfiguration = config
    }
    
    func testSaveAndFetchUniversities() {
        let university = University(name: "Test University", country: "Test Country", webPage: "http://test.com", stateProvince: "Test state")
        DatabaseManager.shared.saveUniversities([university])
        
        let universities = DatabaseManager.shared.fetchUniversities()
        XCTAssertEqual(universities.count, 482)
        XCTAssertEqual(universities.first?.name, "Mohamed bin Zayed University of Artificial Intelligence (MBZUAI)")
    }
}
