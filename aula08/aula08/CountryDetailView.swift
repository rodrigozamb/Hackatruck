//
//  CountryDetailView.swift
//  aula08
//
//  Created by Student25 on 03/08/23.
//

import SwiftUI
import MapKit

struct CountryDetailView: View {
    
    @State var location: Location
    
    var body: some View {
        VStack{
            //Location Name
            Text(location.name)
                .font(.system(size: 42, weight: .bold))
            //Location flag
            AsyncImage(
                url: URL(string: location.flag)
            ){
                image in
                image.resizable()
                    .scaledToFit()
            }placeholder: {
                Color.gray
            }
            .frame(width: 70)
            
            Spacer()
            
            Text(location.description)
                .scaledToFill()
            
            Spacer()
            
        }

        
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView( location: Location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -13.4130536, longitude:-73.1675573 ), flag: "https://png.pngtree.com/thumb_back/fw800/background/20210206/pngtree-brazil-wavy-flag-background-image_557180.jpg", description: "Churrasco e samba") )
    }
}
