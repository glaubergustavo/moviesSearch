//
//  MoviesSearchView.swift
//  moviesSearch
//
//  Created by Glauber Gustavo on 07/01/23.
//

import UIKit

class MoviesSearchView: UIView {
    
     lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = 150
        tableView.estimatedRowHeight = 150
        tableView.registerCell(type: MovieCell.self)
        return tableView
    }()
    
     lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background")
        return image
    }()
    
     lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barStyle = .black
        return searchController
    }()
}
