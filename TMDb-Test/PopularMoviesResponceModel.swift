//
//  PopularMoviesResponceModel.swift
//  TMDb-Test
//
//  Created by Віктор Бережницький on 23.05.2021.
//

import Foundation

// MARK: - PopularMoviesResponceModel
struct PopularMoviesResponceModel: Codable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}


// MARK: - Result
struct Movie: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

//// MARK: - PopularMoviesResponceModel
//struct PopularMoviesResponceModel: Codable {
//    let page: Int?
//    let results: [Movie]
//    let totalPages: Int?
//    let totalResults: Int?
//}
//
//
//// MARK: - Result
//struct Movie: Codable {
//    let adult: Bool?
//    let backdrop_path: String?
//    let genre_ids: [Int]?
//    let id: Int?
//    let original_language: String?
//    let original_title: String?
//    let overview: String?
//    let popularity: Double?
//    let poster_path: String?
//    let release_date: String?
//    let title: String?
//    let video: Bool?
//    let vote_average: Double?
//    let vote_count: Int?
//}
