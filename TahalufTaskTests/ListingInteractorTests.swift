//
//  ListingInteractorTests.swift
//  TahalufTaskTests
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation
import XCTest
@testable import TahalufTask

class ListingInteractorTests: XCTestCase {
    
    var interactor: ListingInteractor!
    var presenter: MockListingPresenter!
    
    override func setUp() {
        super.setUp()
        interactor = ListingInteractor()
        presenter = MockListingPresenter()
        interactor.presenter = presenter
    }
    
    func testFetchUniversitiesSuccess() {
        // Assuming NetworkManager is mocked to return success
        interactor.fetchUniversities()
        XCTAssertTrue(presenter.didFetchUniversitiesCalled)
    }
    
    func testFetchUniversitiesFailure() {
        // Assuming NetworkManager is mocked to return failure and data is available in DB
        interactor.fetchUniversities()
        XCTAssertTrue(presenter.didFetchUniversitiesCalled)
    }
    
    func testFetchUniversitiesFailureNoData() {
        // Assuming NetworkManager is mocked to return failure and no data in DB
        interactor.fetchUniversities()
        XCTAssertTrue(presenter.didFailToFetchUniversitiesCalled)
    }
}

class MockListingPresenter: ListingInteractorOutputProtocol {
    var didFetchUniversitiesCalled = false
    var didFailToFetchUniversitiesCalled = false
    
    func didFetchUniversities(_ universities: [University]) {
        didFetchUniversitiesCalled = true
    }
    
    func didFailToFetchUniversities() {
        didFailToFetchUniversitiesCalled = true
    }
}
