//
//  TelaSalas.swift
//  telaDePerfil
//
//  Created by found on 23/08/24.
//

import SwiftUI

struct TelaSalas: View {
    var body: some View {
        VStack{
            Text("Perfil do usuário").font(.title)
                .bold()
                .padding(50)
                .offset(x: 0, y: -45)
        }
        //Spacer(minLength: 10)
        VStack {
            
            ZStack {
                
                Image("banner-fundo")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                // setando a posicao do banner de fundo
                    .frame(width: 512,
                           height: 240,
                           alignment: .bottomLeading)
                    .offset(x: 0, y:-40)
                // A foto de perfil do usuario
                Image("person-icon")
                    .resizable()
                //.scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 100,
                           height: 100,
                           alignment: .bottom)
                    .offset(x:10, y:80)
            }
            Text("Mateus Almeida").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
}

#Preview {
    TelaSalas()
}
