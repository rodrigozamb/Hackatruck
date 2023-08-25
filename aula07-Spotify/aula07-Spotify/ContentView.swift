//
//  ContentView.swift
//  aula07
//
//  Created by Student25 on 01/08/23.
//
import Foundation
import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    
    @State var songs: [Song] = [
        Song(id: 1, name: "Papercut", artist: "Linkin Park", cover: "https://m.media-amazon.com/images/I/51Oyrjlw5+L._UF1000,1000_QL80_.jpg"),
        
        Song(id: 2, name: "Symphony Of Destruction", artist: "Megadeth", cover: "https://i.ytimg.com/vi/K5jvUXij7nU/sddefault.jpg"),
        
        Song(id: 3, name: "Interlude", artist: "Blazy Ft. Aura Vortex", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMd4z9JQpC6CeXx--V2KLCom5vkqI6TLiykcmb1L--PeV8eR763eXItfT3zVuhGNpv8bc&usqp=CAU"),
        Song(id: 4, name: "Square Hammer", artist: "Ghost", cover: "https://roadie-metal.com/wp-content/uploads/2017/06/unnamed-8.jpg"),
        Song(id: 5, name: "72 Seasons", artist: "Mettalica", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMzQpkpKupTmeIQboHjZv8s7my3_CVKXH-Yw&usqp=CAU"),
    ]
    
    @State var suggestions: [Suggestions] = [
        Suggestions(id: 1, albumCover: "https://m.media-amazon.com/images/I/81pchxSIApL._UF1000,1000_QL80_.jpg", albumName: "And Justice for All"),
        Suggestions(id: 2, albumCover: "https://m.media-amazon.com/images/I/91b6aYwjwjL._UF1000,1000_QL80_.jpg", albumName: "Riot")
    ]
    
    var body: some View {
        NavigationStack{
            VStack {
                
                
                AsyncImage(url:
                            URL(string: "https://i.pinimg.com/1200x/95/c9/45/95c945d8ddc1b3ecc0d367470e24aa8b.jpg")){ image in
                    image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    Color.gray
                }
                .frame(width: 200)
                .padding()
                
                
                VStack{
                    
                    // Album Tilte
                    HStack{
                        Text("HackTruck FM")
                            .font(.system(size: 32, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.leading)
                        Spacer()
                    }
                    
                    //Album author
                    HStack{
                        AsyncImage(url:
                                    URL(string: "https://avatars.githubusercontent.com/u/35114990?v=4")){ image in
                            image
                                .resizable()
                                .scaledToFit()
                            
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 20).padding(.leading)
                        
                        Text("Rodrigo Zamboni")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    //Song List
                    ScrollView{
                        VStack{
                            ForEach(searchResults){
                                song in
                                NavigationLink( destination:SongView(song: song )){
                                    
                                    HStack{
                                        
                                        AsyncImage(url:
                                                    URL(string: song.cover)){ image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                            
                                        } placeholder: {
                                            Color.gray
                                        }
                                        .frame(width: 80)
                                        .padding()
                                        
                                        VStack(){
                                            HStack{
                                                Text(song.name)
                                                Spacer()
                                            }
                                            HStack{
                                                Text(song.artist)
                                                Spacer()
                                            }
                                        }
                                        .foregroundColor(.white)
                                        
                                        Spacer()
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                    
                                }
                                
                                
                            }
                        }
                        
                        // Sugestions
                        VStack{
                            HStack{
                                Text("Sugeridos")
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(suggestions) { suggestion in
                                        
                                        VStack{
                                            AsyncImage(url:
                                                        URL(string: suggestion.albumCover)){ image in
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                
                                            } placeholder: {
                                                Color.gray
                                            }
                                            .frame(width: 200)
                                            .onTapGesture {
                                                print(suggestion)
                                                songs.append(Song(id: 1000+suggestion.id, name: suggestion.albumName, artist: suggestion.albumName, cover: suggestion.albumCover))
                                                suggestions = suggestions.filter(){$0.id != suggestion.id}
                                                print(songs)
                                            }
                                            
                                            Text(suggestion.albumName)
                                                .foregroundColor(.white)
                                        }
                                        .onTapGesture(count: 1){
                                            print("aaa")
                                        }
                                    }
                                }
                                
                            }
                            
                        }
                    }
                    
                    
                }
            }.background(LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .center))
        }
        .searchable(text: $searchText, prompt: "Busque sua música")
        .foregroundColor(.white)
        .accentColor(.white)
    }
    
    
    
    var searchResults: [Song] {
        if searchText.isEmpty {
            return songs
        } else {
            return songs.filter { $0.name.contains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
