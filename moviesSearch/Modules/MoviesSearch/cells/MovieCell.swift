//
//  MovieCell.swift
//  moviesSearch
//
//  Created by Glauber Gustavo on 07/01/23.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var posterView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Movie) {
        guard let image = model.image?.medium,
                let imageURL = URL(string: image) else { return }
        
        posterView.kf.setImage(with: imageURL)
    }

}

extension MovieCell: ViewCode {
    
    func buildHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(posterView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            posterView.topAnchor.constraint(equalTo: containerView.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            posterView.widthAnchor.constraint(equalToConstant: 100),
            posterView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func applyAddtionalChanges() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    
    
}
