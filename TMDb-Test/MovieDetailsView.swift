//
//  MovieDetailsView.swift
//  TMDb-Test
//
//  Created by Віктор Бережницький on 24.05.2021.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movieId: Int
    
    @State private var model: MovieDetailModel?
    @State private var img: UIImage?
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            Image(uiImage: (img ?? UIImage(named: "2"))!)
                .resizable()
                .scaledToFit()
                .overlay(
                    Text(String(model?.title ?? "Title"))
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .truncationMode(.tail)
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                        .padding()
                    , alignment: .bottomLeading)
            
            
            HStack {
                VStack(alignment: .leading, spacing: 10, content: {
                    VStack(alignment: .leading) {
                        Text( "Genre" )
                            .bold()
                            .foregroundColor(.gray)
                        
                        Text( (model?.genres.reduce("", { Result, Genre in
                            Result == "" ? Genre.name : Result + ", " + Genre.name
                        })) ?? "" )
                        .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading) {
                        Text( "Language" )
                            .bold()
                            .foregroundColor(.gray)
                        
                        Text( (model?.spoken_languages.reduce("", { Result, Lan in
                            Result == "" ? Lan.name : Result + ", " + Lan.name
                        })) ?? "" )
                        .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading) {
                        Text( "Vote" )
                            .bold()
                            .foregroundColor(.gray)
                        
                        Text("\(model?.vote_average ?? 0)")
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading) {
                        Text( "Overview" )
                            .bold()
                            .foregroundColor(.gray)
                        
                        Text("\(model?.overview ?? "")")
                            .foregroundColor(.gray)
                    }
                })
                
                Spacer()
            }
            .padding()
            
            
        })
        .navigationTitle("Movie Details")
        .onAppear(perform: {
            fetchMovieDetails()
        })
    }
    
    func fetchMovieDetails() {
        ApiCaller.share.getMoviesFor(id: movieId) { movie in
            DispatchQueue.main.async {
                self.model = movie
                self.img = ApiCaller.share.getImage(imageUrl: movie.backdrop_path)
            }
        }
    }
    
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieId: 550)
    }
}
