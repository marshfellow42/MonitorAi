//
//  TelaMonitoria_2.swift
//  telaMonitoria
//
//  Created by found on 30/08/24.
//

import SwiftUI

struct telaMonitoria2: View {
    
    let id: String
    @State private var nome_responsavel: String
    @State private var nome_monitoria: String
    @State private var hora_disponivel: String
    @State private var array_alunos: Array<String>
    @State private var description: String
    @State private var has_entered: Bool

    init(id: String, nome_responsavel: String, nome_monitoria: String, hora_disponivel: String, array_alunos: Array<String>, description: String, has_entered: Bool) {
        self.id = id
        _nome_responsavel = State(initialValue: nome_responsavel)
        _nome_monitoria = State(initialValue: nome_monitoria)
        _hora_disponivel = State(initialValue: hora_disponivel)
        _array_alunos = State(initialValue: array_alunos)
        _description = State(initialValue: description)
        _has_entered = State(initialValue: has_entered)
    }

    
    var body: some View {
        
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Monitoria") // Título da tela
            .navigationBarTitleDisplayMode(.inline) // Exibe o título de forma inline
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Ação para o botão de voltar
                        print("Back tapped!")
                    }) {
                        Image(systemName: "chevron.left") // Ícone de seta para voltar
                            .foregroundColor(.blue)
                    }
                }
                
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
        } .frame(height: 50)
        
        ScrollView{
            
            VStack{
                
                // CABEÇALHO DA TURMA
                ZStack{
                    
                    // BANNER
                    Image("banner-monitoria")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width) // DEFINIR LARGURA DA IMAGEM IGUAL A LARGURA DA TELA
                        .frame(maxHeight: 139) // LIMITAR A ALTURA DA TELA
                        .clipped()
                        .scaledToFit()
                    
                    // ICONE DA MONITORIA
                    HStack {
                        Image("icon-monitoria")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        //.offset(y: 75)
                        
                        
                        // INFOS NOME E MATERIA
                        VStack (alignment: .leading) {
                            Text("\(nome_monitoria)")
                                .font(.headline)
                            
                            Text("Matéria")
                                .font(.subheadline)
                            
                            Button(action: {
                                
                                
                                if array_alunos.count >= 20 {
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
                                
                                
                                if array_alunos.count >= 20 {
                                    if has_entered{
                                        Text("Sair")
                                            .font(.system(size: 25))
                                            .foregroundStyle(.white)
                                            .background(.red)
                                            .padding()
                                            .clipShape(Rectangle())
                                            .cornerRadius(10)
                                    }else{
                                        Text("Cheio")
                                            .font(.system(size: 25))
                                            .foregroundStyle(.white)
                                            .background(.blue)
                                            .padding()
                                            .clipShape(Rectangle())
                                            .cornerRadius(10)
                                    }
                                }else{
                                    if has_entered{
                                        Text("Sair")
                                            .font(.system(size: 25))
                                            .foregroundStyle(.white)
                                            .background(.red)
                                            .padding()
                                            .clipShape(Rectangle())
                                            .cornerRadius(10)
                                    }else{
                                        Text("Solicitar")
                                            .font(.system(size: 25))
                                            .foregroundStyle(.white)
                                            .background(.green)
                                            .padding()
                                            .clipShape(Rectangle())
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            .offset(x: 170, y: -60)
                            
                        }
                        //.offset(x: 10, y: 93)
                        } .offset(x: -85, y: 130)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // OUTRAS INFORMACOES
                // TA GAMBIARRADO MAS SO SUBE FAZER ASSIM
                HStack{
                    // TEXTO DA ESQUERDA
                    VStack (alignment: .trailing){
                        Text("Responsavel")
                        Text("Dias da semana")
                        Text("Horários")
                        Text("Membros")
                    } .bold().padding(.trailing, 30)
                    
                    // TEXTOS DA DIREITA
                    VStack (alignment: .leading){
                        Text("\(nome_responsavel)")
                        Text("seg, ter, qua, qui, sex")
                        Text("\(hora_disponivel)")
                        Text("\(array_alunos.count) / 90")
                        // Mudar o 90 para outra variável no Materia pois cada sala vai ter um número diferente de alunos que ele irá colocar
                    }
                }
                .padding(.top, 70)
                .padding(.bottom, 30)
                
                // DESCRICAO DA TURMA (SOBRE)
                VStack{
                    Text("Sobre")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("""
                    \(description)
                    """)
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
               
                // ANEXOS DA TURMA
                
                VStack{
                    Text("Anexos")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal){
                        HStack{
                            VStack{
                                Image("anexo-livro")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 150)
                                    .cornerRadius(10)
                                Text("Nome do arquivio.txt")
                                    .frame(width: 100)
                            }
                            
                            VStack{
                                Image("anexo-livro")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 150)
                                    .cornerRadius(10)
                                Text("Nome do arquivio.txt")
                                    .frame(width: 100)
                            }
                            
                            VStack{
                                Image("anexo-livro")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 150)
                                    .cornerRadius(10)
                                Text("Nome do arquivio.txt")
                                    .frame(width: 100)
                            }
                            VStack{
                                Image("anexo-livro")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 150)
                                    .cornerRadius(10)
                                Text("Nome do arquivio.txt")
                                    .frame(width: 100)
                            }
                            
                        }.padding()
                            .scaledToFill()
                            .frame(width: 400, height: 200)
                            //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        
                    }
                    .frame(alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            .background(Color.clear)
                    )
                } .frame(width: 325)
                
            }
            .frame(maxWidth: .infinity)
            
        }
    }
    
}

#Preview {
    telaMonitoria2(
        id: "1",
        nome_responsavel: "Alisson Bonnett",
        nome_monitoria: "Leandro",
        hora_disponivel: "13h30 - 15h30",
        array_alunos: ["Student1", "Student2"],
        description: "Hola amigo",
        has_entered: true
    )
}
