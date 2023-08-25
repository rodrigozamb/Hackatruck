//
//  ContentView.swift
//  desafio 2
//
//  Created by Student25 on 31/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingSheet = false
    
    var body: some View {
        NavigationStack {
            VStack{
                
                NavigationLink("modo 1", destination: Modo1View())
                
                NavigationLink("modo 2", destination: Modo2View())
               
                Button("modo 3"){
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet){
                    
                    Modo4View()
                }
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
