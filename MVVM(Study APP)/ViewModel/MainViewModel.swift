//
//  MainViewModel.swift
//  MVVM(Study APP)
//
//  Created by Александр Андреев on 10.01.2024.
//

import Foundation

class MainViewModel {
    
    // один из примеров использования наблюдателя - это когда мы получаем данные с сервера, может происходить задержка, для этого нам нужно уведомить контроллер о том что произошла задержка и чтобы он отобразил activityIndicator
    var isLoading: Observable<Bool> = Observable(false)
    
    var cellDataSource: Observable<[MovieTableViewCellViewModel]> = Observable(nil)
    
    //Внутри viewModel должна быть ссылка на Model
    var dataSource: TrendingMovieModel?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        //Если данные загружаются, то не делаем ничего
        if isLoading.value ?? true {
            return
        }
        //Если не загружаются, то мы начинаем их загружать
        isLoading.value = true
        
        //weak self, т.к. используем клоужеры внутри клоужеров
        APICaller.getTrendingMovies { [weak self] result in
            //заканчиваем загрузку
            self?.isLoading.value = false
            //отображаем данные
            switch result {
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableViewCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String{
        return movie.title ?? movie.name ?? ""
    }
    
    func retriveMovie( with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
}
