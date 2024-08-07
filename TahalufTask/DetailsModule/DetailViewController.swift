//
//  DetailViewController.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import UIKit

class DetailViewController: UIViewController {
    var presenter: DetailPresenterProtocol?

    private let nameLabel = UILabel()
    private let countryLabel = UILabel()
    private let webPageLabel = UILabel()
    private let refreshButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
    }

    private func setupViews() {
        view.backgroundColor = .white
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        countryLabel.textAlignment = .center
        webPageLabel.textAlignment = .center

        refreshButton.setTitle("Refresh", for: .normal)
        refreshButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [nameLabel, countryLabel, webPageLabel, refreshButton])
        stackView.axis = .vertical
        stackView.spacing = 10

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }

    @objc func refreshButtonTapped() {
        presenter?.refreshListing()
    }
}

extension DetailViewController: DetailViewProtocol {
    func showUniversityDetails(_ university: University) {
        nameLabel.text = university.name
        countryLabel.text = university.country
        webPageLabel.text = university.webPage
    }
}

