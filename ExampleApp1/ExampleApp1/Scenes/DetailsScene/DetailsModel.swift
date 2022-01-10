//
//  DetailsModel.swift
//  ExampleAPP
//
//  Created by HANAN on 07/01/2022.
//

import Foundation

struct MovieDetails: Decodable {
    let imDbId: String
    let title: String
    let fullTitle: String
    let type: String
    let year: String
    let actors: [Actors]
}

struct Actors: Decodable {
    let id: String
    let image: String
    let name: String
    let asCharacter: String
}
