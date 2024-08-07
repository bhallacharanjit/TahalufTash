//
//  NetworkManager.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void) {
        let urlString = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
        
        AF.request(urlString, method: .get)
            .responseData { data in
                if data.response?.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        if let data = data.data {
                            let model = try decoder.decode([University].self, from: data)
                            completion(.success(model))
                        }
                    } catch {
                        print("Error decoding response data: \(error)")
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(NSError(domain: "Network Error", code: data.response?.statusCode ?? 0, userInfo: nil)))
                }
        }
    }
}
