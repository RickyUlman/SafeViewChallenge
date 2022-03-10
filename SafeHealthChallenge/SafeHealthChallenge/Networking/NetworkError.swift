//
//  NetworkError.swift
//  SafeHealthChallenge
//
//  Created by Rickie on 3/10/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case other(Error)
}
