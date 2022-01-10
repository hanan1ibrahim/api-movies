//
//  DetailsUseCaseProtocol.swift
//  ExampleAPP
//
//  Created by HANAN on 07/01/2022.
//

import Foundation

protocol DetailsUseCaseProtocol {
    func addMovieDetails(movieID: String, completionHandler: @escaping (Result<MovieDetails, Error>) -> Void)
}
