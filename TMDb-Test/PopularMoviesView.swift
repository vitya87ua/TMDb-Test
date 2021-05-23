//
//  PopularMoviesView.swift
//  TMDb-Test
//
//  Created by Віктор Бережницький on 23.05.2021.
//

import SwiftUI

struct PopularMoviesView: View {
    
    let models = 6
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            CellUIView()
            CellUIView()
            CellUIView()
        })
        
        
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
