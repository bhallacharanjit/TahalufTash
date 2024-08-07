//
//  NetworkManagerTests.swift
//  TahalufTaskTests
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation
import XCTest
@testable import TahalufTask

class NetworkManagerTests: XCTestCase {
    
    func testFetchUniversitiesSuccess() {
        let expectation = self.expectation(description: "fetchUniversities")
        
        NetworkManager.shared.fetchUniversities { result in
            switch result {
            case .success(let universities):
                XCTAssertGreaterThan(universities.count, 0)
                expectation.fulfill()
            case .failure:
                XCTFail("Expected successful response")
            }
        }
        
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testFetchUniversitiesFailure() {
        // Here you can simulate a network failure by temporarily changing the URL in NetworkManager
        let expectation = self.expectation(description: "fetchUniversitiesFailure")
        
        NetworkManager.shared.fetchUniversities { result in
            switch result {
            case .success:
                XCTFail("Expected failure response")
            case .failure:
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 15.0, handler: nil)
    }
}

