import SwiftUI

struct MonitoriaView: View {
    
    let monitoria: Monitoria
    var is_monitor = UserData.shared.list_users[0].is_monitor
    var matricula = UserData.shared.list_users[0].matricula
    
    let width_number = 350.0
    let height_number = 120.0
    
    let corner_radius_number = 20.0
    
    var body: some View {
        let image = Image("\(monitoria.ImageName)")
            
        //let nome_monitoria: String
        //let ImageName: String
        //let has_entered: Bool
        //let nome_responsavel: String
        //let hora_disponivel: String
        //let array_alunos: Array<String>
        //let description: String
            // Tudo o que eu preciso adicionar é uma forma de colocar a destination junto com o nome_monitoria, diretamente
        
        NavigationLink(destination: telaMonitoria(
            id: ("\(monitoria.id)"),
            nome_responsavel: ("\(monitoria.nome_responsavel)"),
            matricula_responsavel: ("\(monitoria.matricula_responsavel)"),
            nome_monitoria: ("\(monitoria.nome_sala)"),
            hora_disponivel: ("\(monitoria.hora_disponivel)"),
            array_alunos: (monitoria.array_alunos),
            description: ("\(monitoria.description)"),
            has_entered: (monitoria.has_entered),
            img_anexos: ("\(monitoria.img_anexos)"),
            limit_students: ((monitoria.limit_students))
        
        )){
                ZStack {
                    RoundedRectangle(cornerRadius: corner_radius_number)
                        .stroke(Color.gray.opacity(0))
                        .background(
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: width_number, height: height_number)
                                .clipShape(RoundedRectangle(cornerRadius: corner_radius_number))
                        )
                        .frame(width: width_number, height: height_number)
                    
                    HStack {
//                        Implementar o design da Tela Inicial 2 aqui
                        
                        VStack (alignment: .leading) {
                            Text("\(monitoria.nome_sala)")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .font(.title3)
                                .bold()
                            
                            if let index = SalaData.shared.list_salas.firstIndex(where: { $0.matricula_responsavel == "\(matricula)" && is_monitor}) {
                                    
                                    var alunos_atuais = SalaData.shared.list_salas[index].array_alunos.count
                                    var alunos_tot = SalaData.shared.list_salas[index].limit_students
                                    VStack(alignment: .leading) {
                                        Text(" ")
                                        
                                        Text("\(alunos_atuais)/\(alunos_tot)")
                                        
                                    }
                                    .fontWeight(.regular)
                                
                            }else{
                                
                                
                                VStack(alignment: .leading) {
                                    Text(" ")
                                    
                                    Text("\(monitoria.nome_responsavel)")
                                }
                                .fontWeight(.regular)
                                
                            }
                            
                            
                            
                        }
                        .foregroundStyle(.white)
                        .padding(.leading, 20)
                        Spacer()
                        
                        
                        
                        Image("icon-monitoria") // ICON - IMAGEM MENOR
                            .resizable()
                            .frame(width: 80,height: 80)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                    .frame(width: width_number)
//                    .padding(.bottom, 50)
//                    .padding(.leading, 15)
//                    
//                    HStack {
//                        Text("")
//                    }
                }
            }
    }
    
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    NavigationStack{
        MonitoriaView(monitoria: Monitoria(id: 1,
                                           nome_sala: "Marcos",
                                           ImageName: "ImageFill",
                                           has_entered: true,
                                           nome_responsavel: "Alisson Bonnet",
                                           matricula_responsavel: "20222011060990",
                                           hora_disponivel: "18h50m",
                                           array_alunos: ["Student1", "Student2"],
                                           description: "Ola friends",
                                           img_anexos: "lua_image",
                                           array_messages: ["Ola pessoal, sejam bem vindos a essa monitoria", "Entrem no grupo do telegram t.me/teste"],
                                           limit_students: 20
                                          ))
    }
}
