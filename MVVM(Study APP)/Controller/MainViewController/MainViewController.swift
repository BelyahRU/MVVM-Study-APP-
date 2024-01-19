//
//  MainViewController.swift
//  MVVM(Study APP)
//
//  Created by Александр Андреев on 10.01.2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //IBOutlets:
    @IBOutlet weak var tableView: UITableView!
    
    //viewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //variables:
    var cellDataSource: [MovieTableViewCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindingViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }

    
    func configView() {
        self.view.backgroundColor = .black
        self.title = "Main View"
        
        setupTableView()
    }
    
    // в этом методе у нас как раз будет происходить связка нашей модели, в которой у нас находится наблюдаемое свойство
    func bindingViewModel() {
        // описываем действия слушателя
        viewModel.isLoading.bind { [weak self] isLoading in
            // убеждаемся что нет проблем с памятью
            guard let self = self, let isLoading = isLoading else {
                return
            }
            //используем другой поток для отображения
            
            self.activityIndicator.hidesWhenStopped = true
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                    
                } else {
                    self.activityIndicator.stopAnimating()
                    
                }
            }
        }
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetail(movieId: Int) {
        guard let movie = viewModel.retriveMovie(with: movieId) else {
            return
        }
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsController = DetailsMovieViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
        
    }
    
}
