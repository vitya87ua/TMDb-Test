//
//  CellUIView.swift
//  TMDb-Test
//
//  Created by Віктор Бережницький on 23.05.2021.
//

import SwiftUI

struct CellUIView: View {
    
    //    let image: Image
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image("1")
                .resizable()
                .cornerRadius(10)
            
            VStack {
                Spacer()
                
                ZStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(width: .infinity, height: 40, alignment: .center)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                        

                    Text("Captain Marvel")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                        .truncationMode(.tail)
                       
                }
                .mask(Rectangle())
                
            }
            
        }
        .frame(width: 200, height: 300)
        
    }
}

struct CellUIView_Previews: PreviewProvider {
    static var previews: some View {
        //        CellUIView(image: Image("1"))
        CellUIView()
        
    }
}
