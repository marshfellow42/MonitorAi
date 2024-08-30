//
//  ContentView.swift
//  telaDeCriacaoMonitoria
//
//  Created by found on 29/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Criar sala").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                .offset(x: 0, y: 2)
        }
        ScrollView(.vertical){
            // Cabecalho
                Text("Cabecalho")
                HStack{
                    Text("Nome")
                }
        }.border(Color.green)
    }
}

#Preview {
    ContentView()
}
