//
//  ListingInteractor.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation

class ListingInteractor: ListingInteractorInputProtocol {
    weak var presenter: ListingInteractorOutputProtocol?

    func fetchUniversities() {
        NetworkManager.shared.fetchUniversities { [weak self] result in
            switch result {
            case .success(let universities):
                DatabaseManager.shared.saveUniversities(universities)
                self?.presenter?.didFetchUniversities(universities)
            case .failure:
                let cachedUniversities = DatabaseManager.shared.fetchUniversities()
                if cachedUniversities.isEmpty {
                    self?.presenter?.didFailToFetchUniversities()
                } else {
                    self?.presenter?.didFetchUniversities(cachedUniversities)
                }
            }
        }
    }
}
