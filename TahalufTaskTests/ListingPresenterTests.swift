//
//  ListingPresenterTests.swift
//  TahalufTaskTests
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation
import XCTest
@testable import TahalufTask

class ListingPresenterTests: XCTestCase {
    
    var presenter: ListingPresenter!
    var view: MockListingView!
    var interactor: MockListingInteractor!
    var router: MockListingRouter!
    
    override func setUp() {
        super.setUp()
        view = MockListingView()
        interactor = MockListingInteractor()
        router = MockListingRouter()
        presenter = ListingPresenter()
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
    }
    
    func testViewDidLoad() {
        presenter.viewDidLoad()
        XCTAssertTrue(interactor.fetchUniversitiesCalled)
    }
    
    func testRefreshData() {
        presenter.refreshData()
        XCTAssertTrue(interactor.fetchUniversitiesCalled)
    }
    
    func testDidSelectUniversity() {
        let university = University(name: "Test University", country: "Test Country", webPage: "http://test.com", stateProvince: "Test state")
        presenter.didSelectUniversity(university)
        XCTAssertTrue(router.navigateToDetailCalled)
    }
}

class MockListingView: ListingViewProtocol {
    func showUniversities(_ universities: [University]) {}
    func showError(_ message: String) {}
}

class MockListingInteractor: ListingInteractorInputProtocol {
    var fetchUniversitiesCalled = false
    
    func fetchUniversities() {
        fetchUniversitiesCalled = true
    }
}

class MockListingRouter: ListingRouterProtocol {
    var navigateToDetailCalled = false
    
    func navigateToDetail(with university: University) {
        navigateToDetailCalled = true
    }
}
