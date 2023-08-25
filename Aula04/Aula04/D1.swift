//
//  ContentView.swift
//  Aula04
//
//  Created by Student25 on 27/07/23.
//

import SwiftUI

struct D1View: View {
    var body: some View {
        VStack {
            Image( "caminhao")
                .resizable()
                .scaledToFit()
            
            Text("HackaTruck")
                .font(.system(size: 24, weight: .heavy))
                .foregroundColor(.blue)
            
            HStack{
                Text("Maker")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.yellow)
                Text("Space")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct D1View_Previews: PreviewProvider {
    static var previews: some View {
        D1View()
    }
}
