//
//  ContentView.swift
//  aula06
//
//  Created by Student25 on 31/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView{
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                    .badge(2)
                
                SearchView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                PhotosView()
                    .tabItem{
                        Label("Photos", systemImage: "camera")
                    }
                
                MessagesView()
                    .tabItem{
                        Label("Messages", systemImage: "message")
                    }
                
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person")
                    }
                    .badge("!")
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
