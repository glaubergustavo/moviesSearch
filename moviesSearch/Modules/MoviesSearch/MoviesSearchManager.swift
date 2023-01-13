//
//  MoviesService.swift
//  moviesSearch
//
//  Created by Glauber Gustavo on 07/01/23.
//

import Foundation

typealias EpisodeResponse = [Episode]
typealias ShowResponse = [Movie]
typealias SearchShowResponse = [SearchShowElement]

final class MoviesSearchManager {
    
    private let service: ServiceProvider
    
    init(service: ServiceProvider = BaseManager()) {
        self.service = service
    }
    
    func fetchResults(_ search: String, result: @escaping (Result<SearchShowResponse, ServiceError>) -> Void) {
        let parameters = ["q": search]
        service.makeRequest(endpoint: .search, parameters: parameters) { response in
            DispatchQueue.main.async {
                result(response)
            }
        }
    }
    
    func fetchList(result: @escaping(Result<ShowResponse, ServiceError>) -> Void) {
        service.makeRequest(endpoint: .shows, parameters: nil) { response in
            DispatchQueue.main.async {
                result(response)
            }
        }
    }
}
