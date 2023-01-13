//
//  ViewCode.swift
//  moviesSearch
//
//  Created by Glauber Gustavo on 07/01/23.
//

import Foundation

protocol ViewCode {
    
    func buildHierarchy()
    func setupConstraints()
    func applyAddtionalChanges()
}

extension ViewCode {
    
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAddtionalChanges()
    }
}
