//
//  PopularMoviesResponceModel.swift
//  TMDb-Test
//
//  Created by Віктор Бережницький on 23.05.2021.
//

import Foundation

// MARK: - PopularMoviesResponceModel
struct PopularMoviesResponceModel: Codable {
    let page: Int?
    let results: [Movie]
    let totalPages: Int?
    let totalResults: Int?
}


// MARK: - Result
struct Movie: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}
