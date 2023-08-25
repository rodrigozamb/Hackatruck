//
//  PhotosView.swift
//  aula06
//
//  Created by Student25 on 31/07/23.
//

import SwiftUI

struct PhotosView: View {
    
    var images = ["hare.fill", "tortoise.fill", "pawprint.fill", "ant.fill", "figure.stand"]
    
    var body: some View {
        
        ScrollView{
            ForEach(images, id: \.self){ image in
                Image( systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .padding()
            }
        }
    }
}


struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
