//
//  MoviesSearchRouter.swift
//  moviesSearch
//
//  Created by Glauber Gustavo on 07/01/23.
//

import UIKit

final class MoviesSearchRouter: BaseRouter {
        
    override init() {
        super.init()
                
        let controller = MoviesSearchViewController()
        
        let presenter = MoviesSearchPresenter(delegate: controller)
        controller.presenter = presenter
        presenter.router = self
        viewController = controller
            
    }
}
