//
//  TelaMonitoria_2.swift
//  telaMonitoria
//
//  Created by found on 30/08/24.
//

import SwiftUI

struct telaMonitoria3: View {
    
    let id: String
    @State private var nome_responsavel: String
    @State private var nome_monitoria: String
    @State private var hora_disponivel: String
    @State private var array_alunos: Array<String>
    @State private var description: String
    @State private var has_entered: Bool
    @State private var img_anexos: String

    init(id: String, nome_responsavel: String, nome_monitoria: String, hora_disponivel: String, array_alunos: Array<String>, description: String, has_entered: Bool, img_anexos: String) {
        self.id = id
        _nome_responsavel = State(initialValue: nome_responsavel)
        _nome_monitoria = State(initialValue: nome_monitoria)
        _hora_disponivel = State(initialValue: hora_disponivel)
        _array_alunos = State(initialValue: array_alunos)
        _description = State(initialValue: description)
        _has_entered = State(initialValue: has_entered)
        _img_anexos = State(initialValue: img_anexos)
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
                                .fixedSize(horizontal: false, vertical: true)
                            
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
                    } .offset(x: -50, y: 90)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // OUTRAS INFORMACOES
                // TA GAMBIARRADO MAS SO SUBE FAZER ASSIM
                HStack{
                    VStack (alignment: .trailing){
                        Text("Responsavel")
                            .padding(.bottom, 7)
                        Text("Dias da semana")
                            .padding(.bottom, 7)
                        Text("Horários")
                    }
                    //.bold()
                    .font(.custom("SF Pro Text Compact", size: 16))
                    //.padding(.trailing, 20)
                    
                    VStack (alignment: .leading){
                        Text("\(nome_responsavel)")
                            .padding(.bottom, 7)
                        Text("seg, ter, qua, qui, sex")
                        Text("\(hora_disponivel)")
                            .padding(.bottom, 7)
                        Text("\(array_alunos.count) / 20")
                    }
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .lineSpacing(10)
                    .padding(.leading, 40)
                }
                .padding(.top, 80)
                .padding(.bottom, 30)
                
                // DESCRICAO DA TURMA (SOBRE)
                VStack{
                    Text("Sobre")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
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
               
                // ANEXOS DA TURMA
                
                VStack{
                    Text("Anexos")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack { // Adicionei espaçamento aqui
                            ForEach(0..<4) { _ in // Use um loop para simplificar
                                VStack {
                                    Image("\(img_anexos)")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Text("Nome do arquivo.txt")
                                        .frame(width: 100)
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
                
                
            }
            .frame(maxWidth: .infinity)
            
            
        }
        
    }
    
}

#Preview {
    telaMonitoria3(
        id: "1",
        nome_responsavel: "Alisson Bonnett",
        nome_monitoria: "Leandro",
        hora_disponivel: "13h30 - 15h30",
        array_alunos: ["Student1", "Student2"],
        description: "Hola amigo",
        has_entered: true,
        img_anexos: "lua_image"
    )
}
