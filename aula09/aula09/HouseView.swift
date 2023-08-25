//
//  HouseView.swift
//  aula09
//
//  Created by Student25 on 04/08/23.
//

import SwiftUI

struct HouseView: View {
    var house: House

    var body: some View {
        
        TabView{
            
            HouseOverviewView(houseInfos: HouseInfos(name: house.name!, region: house.region!, overlord: house.overlord!, founder: house.founder!, founded: house.founded!, diedUp: house.diedOut!, members: house.swornMembers!) )
                .tabItem{
                    Label("Casa", systemImage: "house")
                }
            
            TitleView(titulos: house.titles!)
                .tabItem{
                    Label("Títulos", systemImage: "info.bubble.fill")
                }
            
            MembersView( membros: house.swornMembers!)
                .tabItem(){
                    Label("Membros", systemImage: "person.3.fill")
                }
        }.onAppear(){
            print(house)
            
        }
            
    }
}

struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView(house: House(url: "https://anapioficeandfire.com/api/houses/16", name: "House Baratheon of King's Landing", region:     "The Crownlands", coatOfArms:     "A black crowned stag and a gold lion, combatant, on a per pale gold and crimson field(Per pale or and gules, a stag, crowned, sable and a lion of the first combatant)", words: "", titles: ["Lord of the Seven Kingdoms", "teste 2", "teste 3"], seats: ["King's Landing"], currentLord: "https://anapioficeandfire.com/api/characters/1029", heir:     "https://anapioficeandfire.com/api/characters/775", overlord:     "https://anapioficeandfire.com/api/houses/15", founded: "283 AC", founder:     "https://anapioficeandfire.com/api/characters/901", diedOut: "", ancestralWeapons: [""], cadetBranches: [""], swornMembers: [
            "https://anapioficeandfire.com/api/characters/355",
            "https://anapioficeandfire.com/api/characters/775",
            "https://anapioficeandfire.com/api/characters/1009",
            "https://anapioficeandfire.com/api/characters/1325",
            "https://anapioficeandfire.com/api/characters/1713",
            "https://anapioficeandfire.com/api/characters/1782",
            "https://anapioficeandfire.com/api/characters/1798",
            "https://anapioficeandfire.com/api/characters/1826"
        ]))
    }
}
