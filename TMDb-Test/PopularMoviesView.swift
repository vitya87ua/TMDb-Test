//
//  PopularMoviesView.swift
//  TMDb-Test
//
//  Created by Віктор Бережницький on 23.05.2021.
//

import SwiftUI

struct PopularMoviesView: View {
    
    @State private var models = [Movie]()
    //    @State private var models = [MovieViewModel]()
    //    @ObservedObject var models = ProductsList()
    
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVGrid(columns: layout, content: {
                ForEach(models, id: \.id) { item in
                    NavigationLink(
                        destination: Text(String(item.id)),
                        label: {
                            ZStack {
                                Image(uiImage: ApiCaller.share.getImage(imageUrl: item.poster_path))
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(15)
                                
                                HStack {
                                    VStack {
                                        Spacer()
                                        
                                        Text(item.title)
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .truncationMode(.tail)
                                            .lineLimit(1)
                                        
                                    }
                                    Spacer()
                                }
                            }
                        })
                }
            })
        })
        .navigationTitle("Popular Movies")
        .padding(10)
        .onAppear() {
            fetchMovie()
        }
        
    }
    
    
    func fetchMovie() {
        ApiCaller.share.getPopularMovies { movies in
            DispatchQueue.main.async {
                self.models = movies.results
            }
        }
    }
    
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
