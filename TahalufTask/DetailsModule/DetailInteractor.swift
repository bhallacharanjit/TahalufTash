//
//  DetailInteractor.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    weak var presenter: DetailInteractorOutputProtocol?
    
    // No data fetching needed for this simple example, as data is passed from Listing
}
