//
//  telaMonitoria.swift
//  telaMonitoria
//
//  Created by found on 30/08/24.
//

import SwiftUI

struct telaMonitoria: View {
    
    let id: String
    @State public var nome_responsavel: String
    @State public var matricula_responsavel: String
    @State public var nome_monitoria: String
    @State public var hora_disponivel: String
    @State public var array_alunos: Array<String>
    @State public var description: String
    @State public var has_entered: Bool
    @State public var img_anexos: String
    @State public var limit_students: Int

//    init(id: String, nome_responsavel: String, nome_monitoria: String, hora_disponivel: String, array_alunos: Array<String>, description: String, has_entered: Bool, img_anexos: String) {
//        self.id = id
//        _nome_responsavel = State(initialValue: nome_responsavel)
//        _nome_monitoria = State(initialValue: nome_monitoria)
//        _hora_disponivel = State(initialValue: hora_disponivel)
//        _array_alunos = State(initialValue: array_alunos)
//        _description = State(initialValue: description)
//        _has_entered = State(initialValue: has_entered)
//        _img_anexos = State(initialValue: img_anexos)
//    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Monitoria") // Título da tela
            .navigationBarTitleDisplayMode(.inline) // Exibe o título de forma inline
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("About") {
                        print("About tapped!")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Help") {
                        print("Help tapped!")
                    }
                }
            }
            .padding()
        } .frame(height: 0)
        
        ScrollView{
            
            VStack{
                
                // CABEÇALHO DA TURMA
                ZStack{
                    // EU ACHO Q ERA P TER UM HSTACK AQUI
                    // E O FRAME DO BOTAO SAI DA TELA
                    // BANNER
                    Image("banner-monitoria")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width) // DEFINIR LARGURA DA IMAGEM IGUAL A LARGURA DA TELA
                        .frame(maxHeight: 140) // LIMITAR A ALTURA DA TELA
                        .clipped()
                        .scaledToFill()
                    
                    // ICONE DA MONITORIA
                    HStack(alignment: .top) {
                        Image("icon-monitoria")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text("\(nome_monitoria)")
                                .frame(width: 190, alignment: .leading)
                                .font(.system(size: 14))
                                .bold()
                                //.fixedSize(horizontal: false, vertical: true)
                            
                            Text("Matéria")
                                .font(.system(size: 13))
                            
                            Button(action: {
                                
                                if array_alunos.count >= limit_students {
                                    if has_entered{
                                        if let index = SalaData.shared.list_salas.firstIndex(where: { $0.id == Int(id) }) {
                                            var alunos = SalaData.shared.list_salas[index].array_alunos

                                            // Remove "Leandro" do array_alunos
                                            if let leandroIndex = alunos.firstIndex(of: "Leandro") {
                                                alunos.remove(at: leandroIndex)
                                            }

                                            // Atualize o array no estado global
                                            SalaData.shared.list_salas[index].array_alunos = alunos
                                            SalaData.shared.list_salas[index].has_entered.toggle()

                                            // Sincronize com o @Binding
                                            array_alunos = alunos
                                            has_entered = SalaData.shared.list_salas[index].has_entered
                                        }
                                    }else{
                                        // exibe um popup dizendo que a sala esta lotada
                                    }
                                }else{
                                    if has_entered{
                                        if let index = SalaData.shared.list_salas.firstIndex(where: { $0.id == Int(id) }) {
                                            var alunos = SalaData.shared.list_salas[index].array_alunos

                                            // Remove "Leandro" do array_alunos
                                            if let leandroIndex = alunos.firstIndex(of: "Leandro") {
                                                alunos.remove(at: leandroIndex)
                                            }

                                            // Atualize o array no estado global
                                            SalaData.shared.list_salas[index].array_alunos = alunos
                                            SalaData.shared.list_salas[index].has_entered.toggle()

                                            // Sincronize com o @Binding
                                            array_alunos = alunos
                                            has_entered = SalaData.shared.list_salas[index].has_entered
                                        }
                                    }else{
                                        if let index = SalaData.shared.list_salas.firstIndex(where: { $0.id == Int(id) }) {
                                            var alunos = SalaData.shared.list_salas[index].array_alunos

                                            if !alunos.contains("Leandro") {
                                                alunos.append("Leandro")
                                            }

                                            // Atualize o array no estado global
                                            SalaData.shared.list_salas[index].array_alunos = alunos
                                            SalaData.shared.list_salas[index].has_entered.toggle()

                                            // Sincronize com o @Binding
                                            array_alunos = alunos
                                            has_entered = SalaData.shared.list_salas[index].has_entered
                                        }
                                    }
                                }
                                
                            }) {
                                
                                
                                if array_alunos.count >= limit_students {
                                    if has_entered{
                                        Text("Sair") // PQ TEM DOIS SAIR?????
                                            .foregroundStyle(Color.white)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding()
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.red.opacity(1))
                                                    .background(Color.clear)
                                            )
                                    }
                                    else{
                                        Text("Cheio")
                                            .foregroundStyle(Color.white)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.gray)
                                                    .background(Color.clear)
                                            )
                                            .frame(width: 100, alignment: .center)
                                            .offset(x:-30)
                                    }
                                }else{
                                    if has_entered{
                                        Text("Sair")
                                            .foregroundStyle(Color.white)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.red)
                                                    .background(Color.clear)
                                            )
                                            .frame(width: 100, alignment: .center)
                                            .offset(x: -30)
                                    }else{
                                        Text("Solicitar")
                                            .foregroundStyle(Color.white)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.green)
                                                    .background(Color.clear)
                                            )
                                            .frame(width: 100, alignment: .center)
                                            .offset(x:-30)
                                    }
                                }
                                
                                
                            }
                            .offset(x: 200, y: -50) // Posicao do botao em si
                        }
                        .padding(.top, 30)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10) // Para ajustar o espaçamento da imagem
                    .position(x: 205, y: 180) // Posicao da linha inteira do HStack
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // OUTRAS INFORMACOES
                // TA GAMBIARRADO MAS SO SUBE FAZER ASSIM
                HStack{
                    VStack (alignment: .leading){
                        Text("Responsavel: ")
                            .padding(.bottom, 5)
                        Text("Dias da semana: ")
                            .padding(.bottom, 5)
                        Text("Horários: ")
                            .padding(.bottom, 5)
                        Text("Alunos: ")
                            .padding(.bottom, 5)
                            
                    }
                    .font(.custom("SF Pro Text Compact", size: 20))
                    .fontWeight(.light)
                    .padding(.leading, 20)
                    
                    VStack (alignment: .leading){
                        Text("\(nome_responsavel)")
                            .underline()
                            .padding(.leading, 2)
                            .padding(.bottom, 2)
                        Text("seg, ter, qua, qui, sex")
                            .padding(.trailing, 2)
                            .padding(.bottom, 2)
                        Text("\(hora_disponivel)")
                            .padding(.bottom, 2)
                        NavigationLink(destination: listarTodosAlunos(alunos_monitoria: array_alunos)) {
                            Text("\(array_alunos.count)/\(limit_students)")
                                .font(.title3)
                                .fontWeight(.light)
                                .padding(.bottom, 2)
                        }
                            .foregroundStyle(.black)
                        
                    }
//                    .font(.system(size: 14))
//                    .fontWeight(.light)
                    .font(.title3)
                    .fontWeight(.light)
                    .padding(.leading, 20)
                }
                .padding(.top, 55)
                .padding(.bottom, 30)
                
                // DESCRICAO DA TURMA (SOBRE)
                VStack{
                    Text("Sobre")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("""
                    \(description)
                    """)
                        .fontWeight(.light)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                    .background(Color.clear)
                            )
                }
                .padding(.bottom, 30)
                .frame(width: 325)
               
                
                // ####### ANEXOS ################################################
                
                if (has_entered){
                    VStack{
                        Text("Ver Anexos")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack { // Adicionei espaçamento aqui
                                ForEach(0..<5) { _ in // Use um loop para simplificar
                                    VStack {
                                        Image("\(img_anexos)")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Text("Material")
                                            .frame(width: 100)
                                            .foregroundStyle(.black)
                                    }
                                    .padding(.horizontal, 5) // Padding para cada item
                                }
                            }
                            .padding() // Padding adicional para o HStack
                        }
                        .frame(height: 200)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                //.background(Color.white)
                                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 5)
                                //.stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                
                        )

                    }
                    .frame(width: 325)
                }else{
                    
                    
                    // ####### ANEXOS ################################################
                    
                    VStack{
                        Text("Pre-Vizualizar Anexos")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack { // Adicionei espaçamento aqui
                                ForEach(0..<2) { _ in // Use um loop para simplificar
                                    VStack {
                                        Image("\(img_anexos)")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Text("Material")
                                            .frame(width: 100)
                                            .foregroundStyle(.black)
                                    }
                                    .padding(.horizontal, 5) // Padding para cada item
                                }
                            }
                            .padding() // Padding adicional para o HStack
                        }
                        .frame(height: 200)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                //.background(Color.white)
                                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 5)
                                //.stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                
                        )

                    }
                    .frame(width: 265)
                    
                    // ####### ANEXOS ################################################
                    
                }
                
                // #######################################################
                
                
            }
            .frame(maxWidth: .infinity)

            .padding(.bottom, 10)
            
        }
        
    }
    
}

#Preview {
    telaMonitoria(
        id: "1",
        nome_responsavel: "Alisson Bonnett",
        matricula_responsavel: "20222011060954",
        nome_monitoria: "Leandro",
        hora_disponivel: "13h30 - 15h30",
        array_alunos: ["Student1", "Student2"],
        description: "Monitoria sobre o estudo da linguagem Lua, com a ilustre participação de Roberto Ierusalimschy (um dos criadores da linguagem).",
        has_entered: false,
        img_anexos: "lua_image",
        limit_students: 50
    )
}
