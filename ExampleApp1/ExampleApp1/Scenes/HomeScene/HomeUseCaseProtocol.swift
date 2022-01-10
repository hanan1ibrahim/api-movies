//
//  HomeUseCaseProtocol.swift
//  ExampleAPP
//
//  Created by HANAN on 07/01/2022.
//

import Foundation

protocol HomeUseCaseFunctions {
    func addImdb250Movies(completionHandler: @escaping (Result<HomeModel, Error>) -> Void)
}
