//
//  NetworkService.swift
//  MVP-pattern
//
//  Created by Maks Kokos on 25.10.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> ())
}

class NetworkService: NetworkServiceProtocol {
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                guard let data = data else { return }
                let objects = try JSONDecoder().decode([Comment].self
                                                      , from: data)
                completion(.success(objects))
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
    }
    
    
}
