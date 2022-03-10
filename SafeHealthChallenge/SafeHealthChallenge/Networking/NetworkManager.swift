//
//  NetworkManager.swift
//  SafeHealthChallenge
//
//  Created by Rickie on 3/10/22.
//

import Foundation

class NetworkManager {
    
    func getStackOverflowResponse(from url: String, completion: @escaping (Result<StackOverflowResponse, NetworkError>) -> Void) {
        guard let url = URL(string: url)
        else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(error)))
                return
            }
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(StackOverflowResponse.self, from: data)
                    completion(.success(response))
                } catch (let error) {
                    completion(.failure(.other(error)))
                }
            }
        }
        .resume()
    }
    
    func getData(from url: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url)
        else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                completion(data)
            }
        }
        .resume()
    }
    
}
