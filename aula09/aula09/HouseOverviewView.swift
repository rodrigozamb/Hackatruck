//
//  HouseOverviewView.swift
//  aula09
//
//  Created by Student25 on 04/08/23.
//

import SwiftUI

struct HouseOverviewView: View {
    
    
    @StateObject var viewModel = ViewModel()
    var houseInfos: HouseInfos

    var body: some View {
        
        ZStack{
            Image("housesbg")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 10)
            
            VStack{
                Text(houseInfos.name)
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color: .black, radius: 3, x: 1, y: 1)

                // Região
                VStack{
                    Text("Região")
                        .font(.system(size: 24, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 1, y: 1)
                    
                    Text(houseInfos.region)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 1, y: 1)
                }

                
                
                // Nascimento e FIM
                HStack{
                    
                    Spacer()
                    
                    VStack{
                        Text("Nascimento")
                            .font(.system(size: 20, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 1, y: 1)
                        
                        Text(houseInfos.founded)
                            .font(.system(size: 20, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 1, y: 1)
                        
                    }
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("Fim")
                            .font(.system(size: 20, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 1, y: 1)
                        
                        
                        Text((houseInfos.diedUp != "" || houseInfos.diedUp == nil) ? houseInfos.diedUp! : "Ainda vive")
                            .font(.system(size: 20, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 1, y: 1)
                        
                    }
                    
                    
                    Spacer()
                    
                }
                
                
                //Founder
                
                VStack{
                    Text("Fundador")
                        .font(.system(size: 24, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                        .shadow(color: .black, radius: 3, x: 1, y: 1)
                    
                    if(viewModel.founderCharacter?.name != nil ){
                        Text(  viewModel.founderCharacter!.name!)
                            .font(.system(size: 32, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()
                            .shadow(color: .black, radius: 3, x: 1, y: 1)
                    }else{
                        Text("Desconhecido")
                            .font(.system(size: 32, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()
                            .shadow(color: .black, radius: 3, x: 1, y: 1)
                    }

                }
                Spacer()
                
                VStack{
                    
                    
                    Text("Lorde")
                        .font(.system(size: 24, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                        .shadow(color: .black, radius: 3, x: 1, y: 1)
                    
                    if( viewModel.lordCharacter?.name != nil ){
                        Text(  viewModel.lordCharacter!.name!)
                            .font(.system(size: 32, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()
                            .shadow(color: .black, radius: 3, x: 1, y: 1)
                    }

                }
                Spacer()
            }
            
        }
        .onAppear(){
            viewModel.fetchFounderCharacter(personURL: houseInfos.founder)
            viewModel.fetchLordCharacter(personURL: houseInfos.overlord)
            
            print("1")
            print(houseInfos.members)
            print("12")
            print(viewModel.houseCharacters)
            print("2")
        }
    }
}

struct HouseOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        HouseOverviewView( houseInfos: HouseInfos(name: "Casa Stark", region: "Norte", overlord: "https://anapioficeandfire.com/api/characters/901", founder: "https://anapioficeandfire.com/api/characters/901",founded: "283 AC", diedUp: "", members: ["https://anapioficeandfire.com/api/characters/49","https://anapioficeandfire.com/api/characters/50"] ))
    }
}
