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
                    .scaledToFit()
                // O icone do monitor
                Image("icon-monitoria")
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .offset(x: -135, y: 90)
            }
            VStack{
                // Nome da monitoria
                Text("Linguagem C").font(.title3).bold()
                    .offset(x: -10, y: 0)
                Text("Matéria").offset(x:-40, y:0)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Solicitar")
                        .font(.system(size: 25))
                        .foregroundStyle(.white)
                        .background(.green)
                        .padding()
                    
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                }).offset(x: 120, y: -30)
            }
        }
    }
}

#Preview {
    ContentView()
}
