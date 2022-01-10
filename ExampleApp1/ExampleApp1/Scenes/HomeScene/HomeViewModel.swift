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
    typealias ActionCompletion = ((UIAlertAction) -> Void)?
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
}

