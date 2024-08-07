//
//  ListingPresenter.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation

class ListingPresenter: ListingPresenterProtocol {
    weak var view: ListingViewProtocol?
    var interactor: ListingInteractorInputProtocol?
    var router: ListingRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchUniversities()
    }
    
    func refreshData() {
        interactor?.fetchUniversities()
    }

    func didSelectUniversity(_ university: University) {
        router?.navigateToDetail(with: university)
    }
}

extension ListingPresenter: ListingInteractorOutputProtocol {
    func didFetchUniversities(_ universities: [University]) {
        view?.showUniversities(universities)
    }
    
    func didFailToFetchUniversities() {
        view?.showError("Failed to fetch universities.")
    }
}
