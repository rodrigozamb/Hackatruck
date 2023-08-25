//
//  ContentView.swift
//  Aula5
//
//  Created by Student25 on 28/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var cor: Color = Color("corNormal")
    @State var imc: Double = 0.0
    @State var peso = ""
    @State var altura = ""
    @State var res = "Normal"
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(cor)
                .ignoresSafeArea()
                .animation(.default, value: cor)
            
            VStack{
                VStack{
                    Text("Calculadora de IMC")
                        .font(.system(size: 36, weight: .bold))
                    
                    TextField("Digite seu peso", text: $peso)
                        .keyboardType(.decimalPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .background(.white).padding()
                    
                    TextField("Digite sua altura", text: $altura)
                        .keyboardType(.decimalPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .background(.white).padding()
                    
                    Button("Calcular"){
                        var pesoConv = Double(peso) ?? 0.0
                        var alturaConv = Double(altura) ?? 1.0
                        imc = pesoConv / ( alturaConv * alturaConv )
                        
                        if imc < 18.5 {
                            cor = Color("corBaixo")
                            res = "Baixo Peso"
                        } else if imc <= 24.99{
                            cor = Color("corNormal")
                            res = "Normal"
                        } else if imc <= 29.99{
                            cor = Color("corSobrepeso")
                            res = "SobrePeso"
                        } else {
                            cor = Color("corObesidade")
                            res = "Obesidade"
                        }
                            
                    }.buttonStyle(.borderedProminent)
                }
                
                Spacer()

                Text(res)
                    .foregroundColor(.white)
                    .font(.system(size: 32))
                
                Spacer()
                
                Image("tabela-IMC")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
