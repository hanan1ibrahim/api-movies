//
//  DetailsUseCase.swift
//  ExampleAPP
//
//  Created by HANAN on 07/01/2022.
//

import Foundation

class DetailsUseCase: DetailsUseCaseProtocol {
    func addMovieDetails(movieID: String, completionHandler: @escaping (Result<MovieDetails, Error>) -> Void)  {
        var request = URLRequest(url: URL(string: "https://imdb-api.com/en/API/FullCast/k_iv0m6bk1/\(movieID)")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return 
          }
            let decoder = JSONDecoder()
            if let movies = try? decoder.decode(MovieDetails.self, from: data) {
                completionHandler(.success(movies))
            } else {
                if error != nil {
                completionHandler(.failure(error!))
                }
            }
          print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
}
