//
//  DetailPresenter.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    private var university: University

    init(university: University) {
        self.university = university
    }

    func viewDidLoad() {
        view?.showUniversityDetails(university)
    }

    func refreshListing() {
        router?.dismissDetail()
    }
}


extension DetailPresenter: DetailInteractorOutputProtocol {
}
