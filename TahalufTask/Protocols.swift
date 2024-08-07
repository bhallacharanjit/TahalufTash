//
//  Protocols.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation
import UIKit

// Listing Module
protocol ListingViewProtocol: AnyObject {
    func showUniversities(_ universities: [University])
    func showError(_ message: String)
}

protocol ListingInteractorInputProtocol: AnyObject {
    func fetchUniversities()
}

protocol ListingInteractorOutputProtocol: AnyObject {
    func didFetchUniversities(_ universities: [University])
    func didFailToFetchUniversities()
}

protocol ListingPresenterProtocol: AnyObject {
    func viewDidLoad()
    func refreshData()
    func didSelectUniversity(_ university: University)
}

protocol ListingRouterProtocol: AnyObject {
    func navigateToDetail(with university: University)
}

// Detail Module
protocol DetailViewProtocol: AnyObject {
    func showUniversityDetails(_ university: University)
}

protocol DetailInteractorInputProtocol: AnyObject {
    // Define methods to fetch data if necessary
}

protocol DetailInteractorOutputProtocol: AnyObject {
    // Define methods to output data if necessary
}

protocol DetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    func refreshListing()
}

protocol DetailRouterProtocol: AnyObject {
    func dismissDetail()
}
