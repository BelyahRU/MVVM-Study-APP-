//
//  MovieTableViewCellViewModel.swift
//  MVVM(Study APP)
//
//  Created by Александр Андреев on 15.01.2024.
//

import Foundation

class MovieTableViewCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageURL: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)/10"
        self.imageURL = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL( _ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
}
