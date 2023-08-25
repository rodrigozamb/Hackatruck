//
//  TitleView.swift
//  aula09
//
//  Created by Student25 on 04/08/23.
//

import SwiftUI

struct TitleView: View {
    
    var titulos: [String]?
    
    var body: some View {
        
        VStack{
            Text("Títulos")
                .font(.system(size: 36, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
                .shadow(color: .black, radius: 3, x: 1, y: 1)
            

            Spacer()
            
            VStack{
                ScrollView(.vertical){
                    VStack{
                        ForEach(titulos!, id: \.self){ titulo in
                            
                            Text(titulo)
                                .font(.system(size: 20, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3, x: 1, y: 1)
                                .padding()
                            
                            
                        }
                    }
                    
                }
            }
            
            
        }
        .background(){
            Image("bg1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .blur(radius: 9)
        }

        
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView( titulos: ["teste 1", "teste 2", "teste 3"])
    }
}
