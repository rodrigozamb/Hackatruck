//
//  CharacterView.swift
//  aula09
//
//  Created by Student25 on 04/08/23.
//

import SwiftUI

struct CharacterView: View {
    
    var character: Character
    
    var body: some View {
        
        VStack{
            VStack{
                Text("Nome")
                    .font(.system(size: 34,weight: .medium))
                    .shadow(radius: 0.6)
                Text(character.name!)
                    .font(.system(size: 20,weight: .medium))
                    .shadow(radius: 0.6)
            }
            
            HStack{
                Spacer()
                Text("Sexo: \(character.gender!)")
                    .font(.system(size: 20,weight: .medium))
                    .shadow(radius: 0.6)
                Spacer()
                Text("Culture: \(character.culture!)")
                    .font(.system(size: 20,weight: .medium))
                    .shadow(radius: 0.6)
                Spacer()
            }
            
            HStack{
                Spacer()
                Text("Nasc: \(character.born!)")
                    .font(.system(size: 20,weight: .medium))
                    .shadow(radius: 0.6)
                Spacer()
                Text("Morte: \(character.died!)")
                    .font(.system(size: 20,weight: .medium))
                    .shadow(radius: 0.6)
                Spacer()
            }
            
            
        }
        
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: Character(url:"https://www.anapioficeandfire.com/api/characters/372" , name: "Rodrigo", gender: "Male", culture: "Samba", born: "25/08/2000", died: "", titles: [""], aliases: [""], father: "Elcio", mother: "Nelsi", spouse: "", allegiance: ["Comp"], books: [""], povBooks: [""], tvSeries: [""], played: [""]))
    }
    
}
