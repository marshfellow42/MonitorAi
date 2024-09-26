/**
 
 o que define o que sera exibido no card? Nome do professor ou quantidade de alunos na sala?
 - Se a pessoa for a dona da sala, aparecera a quantidade de alunos na sala, caso a pessoa nao seja o admin da sala, aparecera o nome do professor.

 como fazer essa diferenciacao?
 - verifica se o usuario logado é monitor em primeiro lugar
    como?
    - puxa esse dado do arrayUser
 - verifica se tem salas que a pessoa é admin.
    como?
    - puxa do arraySalas as salas em que a pessoa e admin
        como?
        - fazendo um filtro
 
 finalmente, se pode diferenciar
 
 */





import SwiftUI

struct MonitoriaView: View {
    
    let monitoria: Monitoria
    
    let width_number = 340.0
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
            limit_students: ((monitoria.limit_students)),
            img_monitoria_photo: ("\(monitoria.img_monitoria_photo)")
        
        ))
        
        
        
        {
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
                        .padding([.leading, .trailing], 20)
                    
                    HStack {
//                        Implementar o design da Tela Inicial 2 aqui
                        
                        VStack (alignment: .leading) {
                            Text("\(monitoria.nome_sala)")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .font(.title3)
                                .bold()
                            
                            // #############################################
                            
                        
                            // #############################################
                            
                            
                            // #############################################
                            VStack(alignment: .leading) {
                                Text(" ")
                                
                                Text("\(monitoria.nome_responsavel)")
                            }
                            .fontWeight(.regular)
                            // #############################################
                            
                        }
                        .foregroundStyle(.white)
                        .padding(.leading, 20)
                        Spacer()
                        
                        
                        Image(monitoria.img_monitoria_photo) // ICON - IMAGEM MENOR
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 5)
                        
                        
//                            .resizable()
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.black, lineWidth: 2)) // Stroke in black
//                            .frame(width: 80, height: 80)
//                            .padding(.trailing)

                        
                        
                    }
                    .frame(width: width_number)
//                    .padding(.bottom, 50)
                    .padding(.trailing, 15)
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
                                           limit_students: 20,
                                           img_monitoria_photo: "icon-monitoria"
                                          ))
    }
}
