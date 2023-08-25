//
//  MembersView.swift
//  aula09
//
//  Created by Student25 on 04/08/23.
//

import SwiftUI

struct MembersView: View {
    
    @State var isSheetShowing = false
    @StateObject var viewModel = ViewModel()
    var membros: [String]
    
    @State var members : [Character] = []
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Text("Membros")
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color: .black, radius: 3, x: 1, y: 1)
                

                Spacer()
                
                VStack{
                    ScrollView(.vertical){
                        VStack{
                            ForEach(viewModel.houseCharacters, id: \.self){ membro in
                                
                                HStack{
                                    Text("\(membro.name!)")
                                        .font(.system(size: 20, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 3, x: 1, y: 1)
                                        .padding()
                                    
                                    
                                    if(membro.gender == "Female"){
                                        
                                        Image("female")
                                            .resizable()
                                            .frame(width: 30,height: 30)
                                    }else if(membro.gender == "Male"){
                                        Image("male")
                                            .resizable()
                                            .frame(width: 30,height: 30)
                                    }
                                    
                                }.onTapGesture {
                                    isSheetShowing.toggle()
                                }.sheet(isPresented: $isSheetShowing){
                                    
                                }
                                
                                
                            }
                        }
                        
                    }
                }
                
                
            }
            .onAppear(){
                viewModel.fetchHouseCharacters(urls:membros)
            }
            .background(){
                Image("bg2")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .blur(radius: 9)
            }
        }
        
        

        
    }
}

struct MembersView_Previews: PreviewProvider {
    static var previews: some View {
        MembersView( membros: ["https://www.anapioficeandfire.com/api/characters/373","https://www.anapioficeandfire.com/api/characters/1"])
    }
}
