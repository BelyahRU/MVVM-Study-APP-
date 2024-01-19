//
//  APICaller.swift
//  MVVM(Study APP)
//
//  Created by Александр Андреев on 10.01.2024.
//

import Foundation
enum NetworkError: Error {
    case urlError
    case canNorParseData
}

public class APICaller {
    
    static func getTrendingMovies(
        completionHandaler: @escaping (_ result: Result<TrendingMovieModel, Error>) -> Void) {
        
            let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key="
            + NetworkConstant.shared.apiKey
            
            guard let url = URL(string: urlString) else {
                completionHandaler(.failure(NetworkError.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
                
                if error == nil , let data = dataResponse, let resultData = try?JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                    completionHandaler(.success(resultData))
                } else {
                    completionHandaler(.failure(NetworkError.canNorParseData))
                }
                
            }.resume()
    }
}
