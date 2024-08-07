//
//  DetailRouter.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule(with university: University) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(university: university)
        let interactor = DetailInteractor()
        let router = DetailRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func dismissDetail() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
