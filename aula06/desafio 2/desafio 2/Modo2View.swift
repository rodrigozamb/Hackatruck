//
//  Modo1View.swift
//  desafio 2
//
//  Created by Student25 on 31/07/23.
//

import SwiftUI

struct Modo2View: View {
    @State var nome = ""
    
    var body: some View {
        
        NavigationStack{
            VStack{
                
                TextField("Digite seu nome", text: $nome)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                Text("Estamos percorrendo um caminho \(nome)")
                
                NavigationLink("Acessar Tela", destination:Modo3View( nome: nome))
            }
        }
        
    }
}

struct Modo2View_Previews: PreviewProvider {
    static var previews: some View {
        Modo2View()
    }
}
