//
//  HomeUseCase.swift
//  ExampleAPP
//
//  Created by HANAN on 07/01/2022.
//
import Foundation

class HomeUseCase: HomeUseCaseFunctions {
    
    func addImdb250Series(completionHandler: @escaping (Result<HomeModel, Error>) -> Void) {
        var request = URLRequest(url: URL(string: "https://imdb-api.com/en/API/Top250TVs/k_iv0m6bk1")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            let decoder = JSONDecoder()
            if let series = try? decoder.decode(HomeModel.self, from: data) {
                completionHandler(.success(series))
            } else {
                if error != nil {
                completionHandler(.failure(error!))
                }
            }
          print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    func addImdb250Movies(completionHandler: @escaping (Result<HomeModel, Error>) -> Void) {
        var request = URLRequest(url: URL(string: "https://imdb-api.com/en/API/Top250Movies/k_iv0m6bk1")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            let decoder = JSONDecoder()
            if let movies = try? decoder.decode(HomeModel.self, from: data) {
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
