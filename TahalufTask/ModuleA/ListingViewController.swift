//
//  ListingViewController.swift
//  TahalufTask
//
//  Created by charanjit singh on 07/08/24.
//

import UIKit
import RealmSwift

class ListingViewController: UIViewController {
    var presenter: ListingPresenterProtocol?

    private let tableView = UITableView()
    private var universities: [University] = []
    let realm = try! Realm()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @objc func refreshButtonTapped() {
        presenter?.refreshData()
    }
}

extension ListingViewController: ListingViewProtocol {
    func showUniversities(_ universities: [University]) {
        self.universities = universities
        tableView.reloadData()
    }
    
    func showError(_ message: String) {
        // Display error message
    }
}

extension ListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.numberOfLines = 4
        cell.textLabel?.text = "\(universities[indexPath.row].name)"
        cell.detailTextLabel?.text = universities[indexPath.row].stateProvince ?? ""
        cell.detailTextLabel?.textColor = .gray
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectUniversity(universities[indexPath.row])
    }
}

