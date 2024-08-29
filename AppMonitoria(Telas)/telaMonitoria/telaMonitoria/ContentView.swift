//
//  ContentView.swift
//  telaMonitoria
//
//  Created by found on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Monitoria").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
        }
        ScrollView{
            ZStack{
                Image("banner-monitoria")
                    .resizable()
                    .scaledToFill()
                // O icone do monitor
                Image("icon-monitoria")
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .offset(x: -135, y: 125)
            }
            VStack{
                // Nome da monitoria
                Text("Linguagem C").font(.title3).bold()
                    .offset(x: -10, y: 0)
                Text("Matéria").offset(x:-40, y:0)
                
                Button(action: {
                    /* 
                        Escrever algoritmo que faz com que: se o botao for clicado, altere o texto para "cheio" e mude a cor para cinza, assim como consta no figmon
                    */
                }, label: {
                    Text("Solicitar")
                        .font(.system(size: 25))
                        .foregroundStyle(.white)
                        .background(.green)
                        .padding()
                    
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                }).offset(x: 135, y: -65)
                HStack{
                    // Informações gerais sobre a turma
                    VStack{
                        Text("Responsável: ").font(.system(size: 20)).bold()
                        HStack{
                            Text("Alisson Bonnet")
                                .offset(x: 155, y:-25 )
                        }
                        Text("Horário: ").font(.system(size: 20)).bold()
                        HStack{
                            Text("13h30 - 15h30; seg, qua, sex")
                                .offset(x: 155, y:-25 )
                        }
                        Text("Membros: ").font(.system(size: 20)).bold()
                        HStack{
                            Text("10 / 20")
                                .offset(x: 155, y:-25 )
                        }
                    }.frame(width: 550, height: 150)
                        .offset(x: -90, y: -60)
                }
            }
            
            // Secao sobre a monitoria
            VStack{
                Text("Sobre: ").font(.system(size: 20)).bold()
                    .offset(x: -120, y: -50)
                VStack{
                    Text("Monitoria sobre a linguagem de programação C")
                            .offset(x: -20, y:-30)
                    Text("Monitores: Fulaninho e Ciclaninho")
                            .offset(x: -15, y:0)
                }   .frame(width: 300, height: 130)
                    .padding()
                    .background(Color.white) // Define a cor de fundo da caixa
                    .cornerRadius(20) // Adiciona cantos arredondados à caixa
                    .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5) // Adiciona a sombra
                    .padding() // Adiciona um espaçamento externo
                    .offset(x: 0, y: -70)
                    
            }
            
            // sidescroller dos anexos porra
            VStack{
                Text("Anexos: ").font(.system(size: 20)).bold()
                    .offset(x: -120, y: -50)
            }
            ScrollView(.horizontal){
                HStack{
                    Image("anexo-livro")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 150)
                        .cornerRadius(10)
                    Image("anexo-livro")
                        .resizable()
                        .scaledToFill()
                        .frame(width:100, height: 150)
                        .cornerRadius(10)
                    Image("anexo-livro")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 150)
                        .cornerRadius(10)
                    Image("anexo-livro")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 150)
                        .cornerRadius(10)
                }.padding()
                
            }.background(Color.white)
                .padding()
                .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5) // Adiciona a sombra
                .offset(x: 40, y: -55)
            
        }
    }
}

#Preview {
    ContentView()
}
