//
//  DetailPresenterTests.swift
//  TahalufTaskTests
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation
import XCTest
@testable import TahalufTask

class DetailPresenterTests: XCTestCase {
    
    var presenter: DetailPresenter!
    var view: MockDetailView!
    var router: MockDetailRouter!
    var university: University!
    
    override func setUp() {
        super.setUp()
        view = MockDetailView()
        router = MockDetailRouter()
        university = University(name: "Test University", country: "Test Country", webPage: "http://test.com", stateProvince: "Test state")
        presenter = DetailPresenter(university: university)
        presenter.view = view
        presenter.router = router
    }
    
    func testViewDidLoad() {
        presenter.viewDidLoad()
        XCTAssertTrue(view.showUniversityDetailsCalled)
    }
    
    func testRefreshListing() {
        presenter.refreshListing()
        XCTAssertTrue(router.dismissDetailCalled)
    }
}

class MockDetailView: DetailViewProtocol {
    var showUniversityDetailsCalled = false
    
    func showUniversityDetails(_ university: University) {
        showUniversityDetailsCalled = true
    }
}

class MockDetailRouter: DetailRouterProtocol {
    var dismissDetailCalled = false
    
    func dismissDetail() {
        dismissDetailCalled = true
    }
}
