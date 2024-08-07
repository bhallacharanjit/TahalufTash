//
//  ListingRouter.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import UIKit

class ListingRouter: ListingRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = ListingViewController()
        let presenter = ListingPresenter()
        let interactor = ListingInteractor()
        let router = ListingRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func navigateToDetail(with university: University) {
        let detailViewController = DetailRouter.createModule(with: university)
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
