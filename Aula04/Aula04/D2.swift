//
//  ContentView.swift
//  Aula04
//
//  Created by Student25 on 27/07/23.
//

import SwiftUI

struct D2View: View {
    var body: some View {
        VStack {
            Image("caminhao")
                .resizable()
                .frame(width: 380, height: 230)
                .scaledToFill()
                .offset(y:-40)
            Spacer()
            
            ZStack{
                Text("HackaTruck")
                    .font(.system(size: 23, weight: .heavy))
                    .foregroundColor(.blue)
                    .offset(y:-50)
                    .zIndex(1)
                
                Image("caminhao")
                    .resizable()
                    .clipShape(Circle())
                    .frame(height: 210)
            }
            
            Spacer()
            ZStack{
                Rectangle()
                    .frame(width: 250)
                    .offset(y:40)
                HStack{
                    Text("Maker")
                        .font(.title)
                        .foregroundColor(.yellow)
                    
                    Text("Space")
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
            
            
        }
        
        .padding()
    }
}

struct D2View_Previews: PreviewProvider {
    static var previews: some View {
        D2View()
    }
}
