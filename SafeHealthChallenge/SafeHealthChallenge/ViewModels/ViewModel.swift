//
//  ViewModel.swift
//  SafeHealthChallenge
//
//  Created by Rickie on 3/10/22.
//

import Foundation

class ViewModel {
    
    private let networkManager = NetworkManager()
    private(set) var questions = [StackOverflowItem]()
    private var cache = [Int: Data]()
    
    var populateData: () -> Void = {}
    
    func getData() {
        networkManager
            .getStackOverflowResponse(from: NetworkURLs.baseURL) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.questions = response.items
                    self?.downloadAllImages()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func getImageData(by index: Int) -> Data? {
        return cache[index]
    }
    
    private func downloadAllImages() {
        var tempCache = [Int: Data]()
        let group = DispatchGroup()
        let imagesPath = questions.map { $0.owner.profileImage }
        for (index, path) in imagesPath.enumerated() {
            group.enter()
            networkManager.getData(from: path) { data in
                tempCache[index] = data
                group.leave()
            }
        }
        group.notify(queue: .main) { [weak self] in
            self?.cache = tempCache
            self?.populateData()
        }
        
    }
    
}
