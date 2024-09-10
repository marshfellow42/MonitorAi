//
//  TelaPrincipal.swift
//  telaMonitoria
//
//  Created by found on 03/09/24.
//

import SwiftUI

struct TelaInicial2: View {
    var body: some View {
        Text("os bixo de bixar eu não sei butar")
        
        VStack{
            ScrollView{
                ZStack{ // SALA -----------
                    Image("ImageFill") // BANNER - IMAGEM MAIOR
                        .resizable()
                    //.scaledToFill()
                        .frame(width: 330, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Image("icon-monitoria") // ICON - IMAGEM MENOR
                        .resizable()
                        .frame(width: 80,height: 80)
                        .clipShape(Circle())
                        .position(x:300, y:60)// parece que offset faz a mesma coisa mas diferente
                    VStack(alignment: .leading) {
                        Text("Nome da monitoria")
                            .fontWeight(.semibold)
                        
                        VStack(alignment: .leading) {
                            Text("Matéria")
                            Text("Responsável")
                        }
                        .fontWeight(.regular)
                    }
                    .foregroundStyle(Color.white)
                    .position(x: 120, y:60)
                }
                .padding(10)
            }
        }
        
        Text("Uwu")
    }
}

#Preview {
    TelaInicial2()
}
