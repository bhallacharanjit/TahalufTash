//
//  University.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation
import Realm.Swift

class University: RealmSwiftObject, Codable {
    @objc dynamic var _id = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var stateProvince: String? = nil
    @objc dynamic var webPage: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case name
        case country
        case webPages = "web_pages"
        case stateProvince = "state-province"
    }
    
    required override init() {}
    
    override static func primaryKey() -> String? {
        return "_id"
    }
    
    convenience init(name: String, country: String, webPage: String, stateProvince: String?) {
        self.init()
        self.name = name
        self.country = country
        self.webPage = webPage
        self.stateProvince = stateProvince ?? ""
    }
    
    required convenience init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let name = try container.decode(String.self, forKey: .name)
            let country = try container.decode(String.self, forKey: .country)
            let stateProvince = try container.decodeIfPresent(String.self, forKey: .stateProvince)
            let webPages = try container.decode([String].self, forKey: .webPages)
            let webPage = webPages.first ?? ""

        self.init(name: name, country: country, webPage: webPage, stateProvince: stateProvince)
        }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(country, forKey: .country)
        try container.encode([webPage], forKey: .webPages)
        try container.encode(stateProvince ?? "", forKey: .stateProvince)
    }
}
