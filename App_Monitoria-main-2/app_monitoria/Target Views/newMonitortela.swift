import SwiftUI

struct newMonitortela: View {
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
        VStack {
            Text("Monitoria").font(.title).bold()
            
            ScrollView {
                ZStack {
                    Image("banner-monitoria")
                        .resizable()
                        .scaledToFill()
                    Image("icon-monitoria")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .offset(x: -135, y: 125)
                }
                
                VStack {
                    Text("\(nome_monitoria)").font(.title3).bold()
                    Text("Matéria")

                    
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
                    .offset(x: 135, y: -65)
                    
                    HStack {
                        VStack {
                            Text("Responsável: ").font(.system(size: 20)).bold()
                            Text("\(nome_responsavel)")
                                .offset(x: 155, y: -25)
                            Text("Horário: ").font(.system(size: 20)).bold()
                            Text("\(hora_disponivel); seg, qua, sex")
                                .offset(x: 155, y: -25)
                            Text("Membros: ").font(.system(size: 20)).bold()
                            Text("\(array_alunos.count) / 20")
                                .offset(x: 155, y: -25)
                        }
                        .frame(width: 550, height: 150)
                        .offset(x: -90, y: -60)
                    }
                }
                
                VStack {
                    Text("Sobre: ").font(.system(size: 20)).bold()
                        .offset(x: -120, y: -50)
                    VStack {
                        Text("\(description)")
                            .offset(x: -20, y: -30)
                    }
                    .frame(width: 300, height: 130)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    .padding()
                    .offset(x: 0, y: -70)
                }
                
                VStack {
                    Text("Anexos: ").font(.system(size: 20)).bold()
                        .offset(x: -120, y: -50)
                    ScrollView(.horizontal) {
                        HStack {
                            Image("anexo-livro")
                                .resizable()
                                .frame(width: 100, height: 150)
                                .cornerRadius(10)
                            Image("anexo-livro")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 150)
                                .cornerRadius(10)
                            Image("anexo-livro")
                                .resizable()
                                .frame(width: 100, height: 150)
                                .cornerRadius(10)
                            Image("anexo-livro")
                                .resizable()
                                .frame(width: 100, height: 150)
                                .cornerRadius(10)
                        }
                        .padding()
                        .scaledToFill()
                        .frame(width: 400, height: 200)
                    }
                    .background(Color.white)
                    .padding()
                    .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    .offset(x: 40, y: -55)
                }
            }
            //fim scroll view
        }
        .onAppear {
            // Inicializa as salas ao aparecer a view
            SalaData.shared.initializeSalas()
        }
    }
}

#Preview {
    newMonitortela(
        id: "1",
        nome_responsavel: "Alisson Bonnett",
        nome_monitoria: "Leandro",
        hora_disponivel: "13h30 - 15h30",
        array_alunos: ["Student1", "Student2"],
        description: "Hola amigo",
        has_entered: true
    )
}

