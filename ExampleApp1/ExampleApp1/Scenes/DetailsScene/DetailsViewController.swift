//
//  DetailsViewController.swift
//  ExampleAPP
//
//  Created by HANAN  on 07/01/2022.
//
import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let loadingIndicator = UIActivityIndicatorView(style: .medium)
    let viewModel = DetailsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingIndicator)
        fetchData()
    }
    func fetchData() {
        loadingIndicator.startAnimating()
        viewModel.passActorsToViewController() { results in
            switch results {
            case .success(_):
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.loadingIndicator.stopAnimating()
                }
            case .failure(let error):
                Alerts().presentErrorAlert(vc: self, title: "Error", msg: error.localizedDescription, btnTitle: "Ok") {_ in
                    print("Error")
                    self.loadingIndicator.startAnimating()
                }
            }
        }
    }
}
// MARK: - TableView
extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.actorsModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.actorsModel[indexPath.row].name
return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
