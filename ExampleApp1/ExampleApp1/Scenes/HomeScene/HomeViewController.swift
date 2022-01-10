//
//  HomeViewController.swift
//  ExampleAPP
//
//  Created by HANAN on 21/12/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let loadingIndicator = UIActivityIndicatorView(style: .medium)
    let viewModel = HomeViewModel()
    var passedFilmId: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingIndicator)
        fetchData()
    }
    func fetchData() {
        loadingIndicator.startAnimating()
        viewModel.passMoviesToViewController { results in
            switch results {
            case .success(_):
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.loadingIndicator.stopAnimating()
                }
            case .failure(let error):
                Alerts().presentErrorAlert(vc: self, title: "Error", msg: error.localizedDescription, btnTitle: "Ok") {_ in
                    self.loadingIndicator.startAnimating()
                }
            }
        }
    }
}
// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.moviesModel[indexPath.row].fullTitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailsViewController.instaintiate(on: .main)
        vc.viewModel.passedID = viewModel.moviesModel[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
}




