//
//  SearchView.swift
//  aula06
//
//  Created by Student25 on 31/07/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 280, height: 280)
            
            Text("Hello, Hackatruck!")
                .font(.system(size: 20, weight: .bold))
        }
        
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
