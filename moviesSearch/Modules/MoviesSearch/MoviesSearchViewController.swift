//
//  MoviesSearchViewController.swift
//  moviesSearch
//
//  Created by Glauber Gustavo on 07/01/23.
//

import UIKit

final class MoviesSearchViewController: BaseViewController, MoviesSearchPresenterDelegate {
    
    var presenter: MoviesSearchPresenter!
    
    private let moviesSearchView: MoviesSearchView = MoviesSearchView()
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.fetchMovies()
    }
    
    //MARK: - PresenterDelegate
    
    func dataLoaded() {
        moviesSearchView.tableView.reloadData()
    }
    
    //MARK: - BaseViewController
    
    override func buildHierarchy() {
        view.addSubview(moviesSearchView.imageView)
        view.addSubview(moviesSearchView.tableView)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            moviesSearchView.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviesSearchView.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesSearchView.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesSearchView.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            moviesSearchView.imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviesSearchView.imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesSearchView.imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesSearchView.imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func applyAddtionalChanges() {
        setupNavigation()
        configUI()
    }
    
    //MARK: - Custom Methods
    
    private func configUI() {
        moviesSearchView.tableView.delegate = self
        moviesSearchView.tableView.dataSource = self
    }
    
    private func setupNavigation() {
        title = "My movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        
        moviesSearchView.searchController.searchBar.delegate = self
        navigationItem.searchController = moviesSearchView.searchController
    }
}

extension MoviesSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueCell(withType: MovieCell.self, for: indexPath) as? MovieCell
        if let movie = presenter?.movies?[indexPath.row] {
            movieCell?.configure(model: movie)
        }
        
        return movieCell ?? UITableViewCell()
    }
}

extension MoviesSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            return
        }
        presenter?.searchMovies(term: searchText)
    }
}

