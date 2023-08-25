//
//  ContentView.swift
//  aula06
//
//  Created by Student25 on 31/07/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        List(1...50, id: \.self) {
            Text("Item \($0)")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
