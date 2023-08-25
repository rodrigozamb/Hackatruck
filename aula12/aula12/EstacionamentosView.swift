//
//  EstacionamentosView.swift
//  aula12
//
//  Created by Student25 on 09/08/23.
//

import SwiftUI

struct EstacionamentosView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var isSheetShowing = false
    var body: some View {
        
        VStack{
            
            Text("Estacionamentos")
                .font(.system(size: 32, weight: .bold))
            
            ScrollView{
                
                VStack{
                    
                    ForEach(viewModel.estacionamentos, id: \.self){ estacionamento in
                        
                        VStack{
                            Text(estacionamento.nomeEstacionamento!)
                            Text(estacionamento.endereco!)
                            Text("Vagas: \(estacionamento.vaga!)")

                        }
                        .padding()
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(14)
                        
                        .onTapGesture {
                            isSheetShowing.toggle()
                        }
                        .sheet(isPresented: $isSheetShowing){
                            
                            ForEach(estacionamento.carro!, id: \.self){ carro in
                                
                                VStack{
                                    Text("Modelo: \(carro.modelo!)")
                                        .padding()
                                    Text("Ano: \(carro.ano!)")
                                        .padding()
                                    Text("Cor: \(carro.cor!)")
                                        .padding()
                                    Text("Preço: \(carro.preco!)")
                                        .padding()
                                }
                            }
                            
                        }
                        .padding()
                    }
                    
                }.onAppear(){
                    
                    viewModel.fetchEstacionamentos()
                }
            }
            Spacer()
        }
        
        


        
    }
}

struct EstacionamentosView_Previews: PreviewProvider {
    static var previews: some View {
        EstacionamentosView()
    }
}
