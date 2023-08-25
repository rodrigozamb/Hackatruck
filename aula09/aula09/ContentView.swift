//
//  ContentView.swift
//  aula09
//
//  Created by Student25 on 04/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationStack{
        
            ZStack{
                
                Image("GOTBG")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Game Of Thrones")
                        .font(.system(size: 48, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                    Spacer()
                    
                    Text("Escolha uma casa")
                        .font(.system(size: 32, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    ScrollView(.vertical){
                        ForEach(viewModel.houses, id: \.url){ house in
                            
                            VStack{
                                
                                NavigationLink( destination: HouseView(house: house))
                                {
                                    Text(house.name!)
                                        .padding()
                                    
                                }
                                .padding()
                                .background(.black
                                )
                                .foregroundColor(.white)
                                .font(.headline)
                                .cornerRadius(14)
                            }
                               
                        }
                    }
                    
                    Spacer()
                }.onAppear(){
                    viewModel.fetchHouses()

                }
            }
            
        }
        .tint(.white)
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
