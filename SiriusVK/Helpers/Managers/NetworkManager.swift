//
//  NetworkManager.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import Foundation

final class NetworkManager: Manager {
    // MARK: Errors
    enum NetworkErrors: String, Error {
        case invalidURL = "Invalid URL"
        case failedFetchingData = "Failed fetching data"
        case invalidData = "Invalid Data"
        case failedToDecode = "Failed decoding data"
    }
    
    // MARK: Constants
    struct Constants {
        static let baseURL = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
    }
    
    // MARK: Internal
    func fetch<T: Decodable>(with url: String, completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkErrors.invalidURL))
            return
        }
        
        let task = URLSession(configuration: .default).dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(NetworkErrors.failedFetchingData))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkErrors.invalidData))
                return
            }

            guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(NetworkErrors.failedToDecode))
                return
            }
            
            completion(.success(decodedData))
        }
        
        task.resume()
    }
    
    func fetchApps(completion: @escaping (Result<VKResponse, Error>) -> ()) {
        fetch(with: Constants.baseURL, completion: completion)
    }
}
