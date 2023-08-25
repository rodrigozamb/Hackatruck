//
//  SongView.swift
//  aula07
//
//  Created by Student25 on 01/08/23.
//

import Foundation
import SwiftUI

struct SongView: View {
    
    @State var song: Song
    @State var songIsPlaying = false
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .center).ignoresSafeArea()
            
            VStack {
                Spacer()
                
                //Songe cover image
                AsyncImage(url:
                            URL(string: song.cover )){ image in
                    image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    Color.gray
                }
                .frame(width: 250, height: 250)
                
                // Name and Title
                VStack{
                    Text(song.name)
                        .font(.system(size: 24, weight: .semibold))
                    Text(song.artist)
                }.foregroundColor(.white)
                
                Spacer()
                
                // Display Buttons
                HStack{
                    Image(systemName: "shuffle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding()
                    
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding()
                    
                    Button(action: {
                        songIsPlaying.toggle()
                        
                    }){
                        Image(systemName: songIsPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, alignment: .center)
                            .padding()
                    }
                    
                    
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding()
                    
                    Image(systemName: "repeat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding()
                }
                .foregroundColor(.white)
                
            
                Spacer()
                
            }
        }
        
    }
    
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(song: Song(id: 1, name: "In The End", artist: "Linkin Park", cover: "https://i.scdn.co/image/ab67616d0000b27346557fdc7325844aa2177155"))
    }
}


