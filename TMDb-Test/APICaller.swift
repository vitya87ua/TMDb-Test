//
//  APICaller.swift
//  TMDb-Test
//
//  Created by Віктор Бережницький on 23.05.2021.
//

import Foundation
import UIKit

struct ServerResponce: Codable {
    let success: Bool?
    let expires_at: String?
    let request_token: String?
}

struct SingInRequest: Codable {
    let username: String
    let password: String
    let request_token: String
}


class ApiCaller {
    static let share = ApiCaller()
    
    
    private let baseUrlAuth =       "https://api.themoviedb.org/3/authentication/token/new?api_key="
    private let singInUrl =         "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key="
    private let popularMoviesUrl =  "https://api.themoviedb.org/3/movie/popular?api_key=56af4d7d6e0da24d3fe208f8a04b854b&language=en-US&page=1"
    private let baseImageUrl =       "https://image.tmdb.org/t/p/w500"
    
    private let movieDetailUrl =       "https://api.themoviedb.org/3/movie/"
    
    private let apiKey = "56af4d7d6e0da24d3fe208f8a04b854b"
    
    
    //Create Request Token
    func getToken(completion: @escaping (ServerResponce) -> Void) {
        
        var request = URLRequest(url: URL(string: baseUrlAuth + apiKey)!)
        
        URLSession.shared.dataTask(with: request) { data, responce, error in
            //            print("data: \(data), error \(error)")
            
            let json = try! JSONDecoder().decode(ServerResponce.self, from: data!)
            
            completion(json)
            
        }.resume()
    }
    
    
    
    // Create Session With Login
    func signIn(requestSignIn: SingInRequest, completion: @escaping (Bool) -> Void) {
        let body = try! JSONEncoder().encode(requestSignIn)
        
        var request = URLRequest(url: URL(string: singInUrl + apiKey)!)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request) { data, responce, error in
            print("data: \(data), error \(error)")
            
            let json = try! JSONDecoder().decode(ServerResponce.self, from: data!)
            
            completion(json.success!)
            
        }.resume()
        
    }
    
    //Create Request Token
    func getPopularMovies(completion: @escaping (PopularMoviesResponceModel) -> Void) {
        
        var request = URLRequest(url: URL(string: popularMoviesUrl)!)
        
        URLSession.shared.dataTask(with: request) { data, responce, error in
            //            print("data: \(data), error \(error)")
            
            let json = try! JSONDecoder().decode(PopularMoviesResponceModel.self, from: data!)
            
            DispatchQueue.main.async {
                completion(json)
            }
            
        }.resume()
    }
    
    
    func getMoviesFor(id: Int, completion: @escaping (MovieDetailModel) -> Void) {
        
        let url = URL(string: movieDetailUrl + "\(id)" + "?api_key=" + apiKey + "&language=en-US")!
                
        URLSession.shared.dataTask(with: url) { data, responce, error in
            //            print("data: \(data), error \(error)")
            
            let json = try! JSONDecoder().decode(MovieDetailModel.self, from: data!)

            DispatchQueue.main.async {
                completion(json)
            }
            
        }.resume()
    }

    
    
    func getImage(imageUrl: String) -> UIImage {
        let url = URL(string: "https://image.tmdb.org/t/p/w500" + imageUrl)!
        
        let data = try! Data(contentsOf: url)
        
        return UIImage(data: data)!
    }
    
}

