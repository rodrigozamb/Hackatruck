//
//  ContentView.swift
//  aula12
//
//  Created by Student25 on 09/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image("estacionamento")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                 
                    Spacer()
                    
                    Text("Parking Hub")
                        .font(.system(size: 52, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink( destination: EstacionamentosView())
                    {
                        Text("Entrar")
                            .padding()
                        
                    }
                    .padding()
                    .background(.black
                    )
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(14)
                    Spacer()
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
