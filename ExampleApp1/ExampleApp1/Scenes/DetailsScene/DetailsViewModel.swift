//
//  DetailsViewModel.swift
//  ExampleAPP
//
//  Created by HANAN  on 07/01/2022.
//

import Foundation
import UIKit

class DetailsViewModel {
    let detailsUseCase = DetailsUseCase()
    var actorsModel = [Actors]()
    var passedID: String?
    var isCompleteFetching: Bool = false
    func passActorsToViewController(completionHandler: @escaping (Result<[Actors], Error>) -> Void) {
        guard let passedID = passedID else {return}
        detailsUseCase.addMovieDetails(movieID: passedID) { results in
            switch results {
            case .success(let movies):
                let items = movies.actors
                self.actorsModel = items
                self.actorsModel = items 
                completionHandler(.success(items))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
