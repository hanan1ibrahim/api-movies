//
//  HomeViewModel.swift
//  ExampleAPP
//
//  Created by HANAN on 07/01/2022.
//

import Foundation
import UIKit

class HomeViewModel {
    let homeUseCase = HomeUseCase()
    var moviesModel = [Item]()
    var seriesModel = [Item]()
    typealias ActionCompletion = ((UIAlertAction) -> Void)?
    
    var moviesCount: Int {
        return moviesModel.count
    }
    var seriesCount: Int {
        return seriesModel.count
    }
    func getSeriesModel(indexPath: IndexPath ) -> Item {
        return seriesModel[indexPath.row]
    }
    func getMoviesModel(indexPath: IndexPath ) -> Item {
        return moviesModel[indexPath.row]
    }
    func passMoviesToViewController(completionHandler: @escaping (Result<[Item], Error>) -> Void) {
        homeUseCase.addImdb250Movies { results in
            switch results {
            case .success(let movies):
                guard let items = movies.items else {return}
                self.moviesModel = items
                completionHandler(.success(items))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    func passSeriesToVC(completionHandler: @escaping (Result<[Item], Error>) -> Void) {
        homeUseCase.addImdb250Series { results in
            switch results {
            case .success(let series):
                guard let items = series.items else {return}
                self.seriesModel = items
                completionHandler(.success(items))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    func navigateToMoviesDetails(currentVC: UIViewController, indexPath: IndexPath) {
        let vc = DetailsViewController.instaintiate(on: .main)
        vc.viewModel.passedID = moviesModel[indexPath.row].id
        currentVC.navigationController?.pushViewController(vc, animated: true)
    }
    func navigateToSeriesDetails(currentVC: UIViewController, indexPath: IndexPath) {
        let vc = DetailsViewController.instaintiate(on: .main)
        vc.viewModel.passedID = moviesModel[indexPath.row].id
        currentVC.navigationController?.pushViewController(vc, animated: true)
    }
}
