//
//  ContentView.swift
//  TMDb-Test
//
//  Created by Віктор Бережницький on 23.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                
                Section {
                    TextField("Login", text: $login)
                        //                            .background(Color.yellow)
                        .padding(.horizontal, 20)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                    
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                
                Button(action: {
                    
                }, label: {
                    Text("Sign In")
                        .frame(width: 210, height: 50, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                })
                .padding(.top, 10)
                
                Spacer()
            }
            .navigationTitle("Sign In")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
