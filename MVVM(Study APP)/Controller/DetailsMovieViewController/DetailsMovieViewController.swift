//
//  DetailsMovieViewController.swift
//  MVVM(Study APP)
//
//  Created by Александр Андреев on 15.01.2024.
//

import Foundation
import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {
    
    var imageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFill
        return im
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    
    //View Model:
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        setupSubviews()
        setupConstraints()
        configView()
    }
    
    func configView() {
        self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        descriptionLabel.text = viewModel.movieDescription
        imageView.sd_setImage(with: viewModel.movieImage)
    }
}

//MARK: settings for view
extension DetailsMovieViewController {
    func setupSubviews() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.trailing.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(605)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(60)
            make.trailing.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(8)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(8)
        }
    }
}
