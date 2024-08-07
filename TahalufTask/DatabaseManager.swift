//
//  DatabaseManager.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation
import RealmSwift

class DatabaseManager {
    static let shared = DatabaseManager()
    let realm = try! Realm()
    
    private init() {}
    
    func saveUniversities(_ universities: [University]) {
        try! realm.write {
            realm.add(universities, update: .modified)
        }
    }
    
    func fetchUniversities() -> [University] {
        return Array(realm.objects(University.self))
    }
}
