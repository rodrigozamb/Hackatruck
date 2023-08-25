//
//  ContentView.swift
//  aula08
//
//  Created by Student25 on 03/08/23.
//

import SwiftUI
import MapKit
import CoreLocation


struct ContentView: View {
    
    @State var paisAtual = "Brasil"
    @State var showingSheet = false
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -14.2350, longitude: -51.9253
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 20, longitudeDelta: 20
        )
    )
    
    @State var paises: [Location] = [
        Location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -13.4130536, longitude:-73.1675573 ), flag: "https://png.pngtree.com/thumb_back/fw800/background/20210206/pngtree-brazil-wavy-flag-background-image_557180.jpg", description: "Churrasco e samba"),
        Location(name: "Estados Unidos", coordinate: CLLocationCoordinate2D(latitude: 35.6575614, longitude:-116.9749293 ), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/1280px-Flag_of_the_United_States.svg.png", description: "Fast food e armas"),
        Location(name: "Reino Unido", coordinate: CLLocationCoordinate2D(latitude: 51.5285262, longitude:-0.2664053 ), flag: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIDulnTP_j2lekRTqaYGutnWr2NjetHWWWGA&usqp=CAU", description: "Proteja a rainha!!"),
        Location(name: "China", coordinate: CLLocationCoordinate2D(latitude: 33.8690178, longitude:82.7757491 ), flag: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARMAAAC3CAMAAAAGjUrGAAAAkFBMVEXeKRD/3gD/4AD/4wD/4QDbABH/5wD/5QDeJRDdHxDcDhHdGhD6xwX/6AD6yQXdIRD80APypAn91gLpcgzjTw7mYg3iRg/0rAj91QLlWw7gNw/shAv+2gH3uQb5wgXvlgrxnAnujwrnaw3gPA/1sQfqegzwmQrukQr/8ADkVg7iSA7mYA3tiQvpdgzxoQnrgAttyVeOAAAFS0lEQVR4nO3c53riOhAGYCRZHWNTQjGGUNNIuf+7O66pLLG97AlWvvdfAsljjzUqI0GnAwAAAAC/nP7pC7g8dj5SP30Nl6JoHnZ2Z3/2Qi5HNLc2aR/BmFHz09dyKWyfrSKjO7E3RUxKNpZiceh5tIuYlPRQEE9S4i0Qk1d86ZEE7Y6568Nx5YFVbRnJgiKWG25dHo9V5dmG3eQxIcTz4+utw0Gx/UNQ6Y16lHQmKSZl7/nJ5Zjw+LnSHExFhFIviQrrX2ljtcMhUSN/wKu8LxgIEe+6lIix6/NYe8PEqELy6N1kv+VmK4io3iu3FJ9Stqry4G2WLmYlmevNRD0IQqdVkqdg49j1KZu9TsZXUWPxr4fOL3d4mI4k1zXSwdR5cxupsUgnpmGN5PlYZnOwu7W32dRUjBveWzSuNt9rE97LpqbstmE+mEFUBCVwpcWorchXdb06yfOO6Q06aVA0f7p3JCh2XazqRMPVi93JqVKab0JnRiOTp06SPOtmyZMM5d7UDkPhXznSsZSpkyZPs8es95JQT1K6bJh8F+c1dQjxo0bJYx/yqPozR5pJx3RpGRP22CB5tNlPs//gLdrZTKz5jHfK1EmLrPzL6+b0s08jUlSZ6NK0cdQJVmG31CuEr80kedTpb/OXl4Xe5lRQ9Au9k17ZR7czKGbtM/oJeefza5LMTqeTGg+vdyHL/rS1QRkNGKlMLPR3GxZKW8OTbpqGAyH8ZSsnKIHdie+DkTcaOeeVnrseSiIj3pnNJ9et3PRRfC/p9wFJuodp1ZqrGgnWNx0VaNvKkCTsNpTfNxIx+WbIeUdL2faCgTJ9/5um4rFhjdkGj2/aX2MyG+qdConsRXVu0ixVy5tJykbdP+cP9VfVOteSalqOuiyKX/8pfxg51B1SnQhJwszio1MVsfzFhxq1WhzpVOi6Xt44Rm++9imUtHN1ey5md6SdyM3vzZyEoUd6WTZp5ZrlTIIjqZMmz2+OiZ0cH3dcqTQ3YcjRCQrrN6lAnv/yfkJweFc0YG+9LY3rjzy6SSX3Atn+a+pQ8bh4C5CoX383oRsJx+MyddhgZPijeP2x2nm/d5TynRitgntRNpKdDdJdmmnRbmodWcrooWQu9Ch2lYfAY0/5ZD6wk2JVWOfIUv6/Jkzus6C0e1nA852q95USPsy7Wla9QqRswiRp6C25MVZH0b+52v+FGmWHk8SHSomNeuk0rvqRJTV7XvUnu0XS5OggJuyu12x79TLYG3akUqL4TZo/1Y8s2RchmZd/VIPWrkVdmPRcn1ioLz1jVlWpcWTJdpblgEXZptWDjxqLP2zfaLUQdY4sKf6SLyVpuG33xM3e+tOH47eg+Fz6dY4smWG2lmSrVreS5D6mJ7Zv7HhQ57xfOiFOmkrbF9Rquz+VHYF9rDEF4wPqxUtBRMurUV87149q3F3SNckwShJO7trdUM7IPt5NjOrYbffOhZ2vszDdeZaHiq/rZJzT1OuxnXYPxWeFhCk4UUI6L9OkaOs2s3bmaP1f21qbfQLj0NLTfP/EtD/iNoioh5iU9MwX4TrqefiujzemzygTlHi733384AM7yIslvYPb3/RRh57JYgckXo2rnxZ1mtLlVhkVd47s/v0t3s13lj1BdvsIIUmYZ5nW1Ii3uOfG5a8/qc4OfSbipKnIOeb2OTXyu7dJAxnQYisUOuqqY5LJfTJzk0+ISaEoLpq+f/Ijcb+SJRiFPwuuDhhzPnPmGywAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgTP4DZjA/S1Rr0zQAAAAASUVORK5CYII=", description: "Sushi e etc"),
        
        
        
    ]
    
    var body: some View {
        
        ZStack{
            
            NavigationView{
                Map(coordinateRegion: $region, annotationItems: paises){ local in
                    MapAnnotation(coordinate: local.coordinate){
                        
                        Button {
                            showingSheet.toggle()
                            print(local)
                        } label : {
                            Label("", systemImage: "pin.circle.fill")
                        }
                        .font(.system(size: 32))
                        .sheet(isPresented: $showingSheet){
                            VStack{
                                //Location Name
                                Text(local.name)
                                    .font(.system(size: 42, weight: .bold))
                                //Location flag
                                AsyncImage(
                                    url: URL(string: local.flag)
                                ){
                                    image in
                                    image.resizable()
                                        .scaledToFit()
                                }placeholder: {
                                    Color.gray
                                }
                                .frame(width: 70)
                                
                                Spacer()
                                
                                Text(local.description)
                                    .scaledToFill()
                                
                                Spacer()
                                
                            }
                        }
                    }
                    
                    
                }
                .scaledToFill()
                .ignoresSafeArea()
            }

            
            VStack {
                
                Text("Mapa Mundi")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .padding()
                Text(paisAtual)
                    .font(.system(size: 24, weight: .bold))
                Spacer()
                

                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(paises){ pais in
                            
                            Button(action: {
                                region.center = pais.coordinate
                                paisAtual = pais.name
                                
                            }){
                                AsyncImage(
                                    url: URL(string: pais.flag)
                                ){
                                    image in
                                    image.resizable()
                                        .scaledToFit()
                                }placeholder: {
                                    Color.gray
                                }
                                .frame(width: 100)
                                .padding()
                            }
                        }
                        
                    }
                }
                
                
            }
            .padding()
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
