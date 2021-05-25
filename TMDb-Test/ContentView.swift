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
    @State private var isSucces = false
    @State private var colorIs = Color.black
    @State private var wrongPassOrLogin = ""
    
    var body: some View {
        
        NavigationView {
            //            NavigationLink("Lorer", destination: PopularMoviesView())
            
            
            VStack {
                
                Section {
                    TextField("Login", text: $login)
                        .foregroundColor(colorIs)
                        .padding(.horizontal, 20)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(colorIs)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                    
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                
                Button(action: {
                    
                    ApiCaller.share.getToken { responce in
                        let requestSingIn = SingInRequest(username: login, password: password, request_token: responce.request_token!)
                        
                        ApiCaller.share.signIn(requestSignIn: requestSingIn) { isSucces in
                            if isSucces {
                                print(#function, "GOOD")
                                colorIs = .black
                                wrongPassOrLogin = ""
                                self.isSucces.toggle()
                            } else {
                                wrongPassOrLogin = "Password or login are incorrect"
                                print(#function, "BAD")
                                colorIs = .red
                            }
                        }
                    }
                }, label: {
                    Text("Sign In")
                        .frame(width: 210, height: 50, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        
                })
                .padding(.top, 10)
                
                NavigationLink(
                    destination: PopularMoviesView(),
                    isActive: $isSucces,
                    label: {
                    })

                Text(wrongPassOrLogin)
                    .foregroundColor(.red)
                    .padding(.top, 20)
                
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
