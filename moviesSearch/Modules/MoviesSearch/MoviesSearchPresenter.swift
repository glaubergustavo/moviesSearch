//
//  MoviesSearchPresenter.swift
//  moviesSearch
//
//  Created by Glauber Gustavo on 07/01/23.
//

import Foundation

protocol MoviesSearchPresenterDelegate {
    func dataLoaded()
}

final class MoviesSearchPresenter: BasePresenter {
    
    var delegate: MoviesSearchPresenterDelegate?
    
    var movies: [Movie]? {
        didSet {
            delegate?.dataLoaded()
        }
    }
    private let service: MoviesSearchManager = MoviesSearchManager()
    
    init (delegate: MoviesSearchPresenterDelegate?) {
        self.delegate = delegate
    }
    
    func fetchMovies() {
        service.fetchList { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies = response
            case .failure:
                self?.movies = nil
            }
        }
    }
    
    func searchMovies(term: String) {
        service.fetchResults(term) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies = response.compactMap({ $0.show })
            case .failure:
                self?.movies = nil
            }
        }
    }
}
