//
//  NetworkConstant.swift
//  MVVM(Study APP)
//
//  Created by Александр Андреев on 10.01.2024.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //Singletone
    }
    
    public var apiKey: String {
        //API key from //https://www.themoviedb.org/
        get {
            return "adbad19235e6bc7cd2797dee7002ba2f"
        }
        
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAdress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
