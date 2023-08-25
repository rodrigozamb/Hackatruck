//
//  Modo1View.swift
//  desafio 2
//
//  Created by Student25 on 31/07/23.
//

import SwiftUI

struct Modo3View: View {
    @State var nome: String
    
    var body: some View {
        
        VStack{
            Text("Volte \(nome)")
        }
        
    }
}

struct Modo3View_Previews: PreviewProvider {
    static var previews: some View {
        Modo3View( nome: "Rodrigo")
    }
}
