import SwiftUI

struct MateriaView: View {
    
    let materia: Materia
    
    let width_number = 350.0
    let height_number = 120.0
    
    let corner_radius_number = 20.0
    
    var body: some View {
        let image = Image("\(materia.ImageName)")
            
        //let nome_materia: String
        //let ImageName: String
        //let has_entered: Bool
        //let nome_responsavel: String
        //let hora_disponivel: String
        //let array_alunos: Array<String>
        //let description: String
            // Tudo o que eu preciso adicionar é uma forma de colocar a destination junto com o nome_materia, diretamente
        
        NavigationLink(destination: telaMonitoria(
            id: ("\(materia.id)"),
            nome_responsavel: ("\(materia.nome_responsavel)"),
            nome_monitoria: ("\(materia.nome_sala)"),
            hora_disponivel: ("\(materia.hora_disponivel)"),
            array_alunos: (materia.array_alunos),
            description: ("\(materia.description)"),
            has_entered: (materia.has_entered),
            img_anexos: ("\(materia.img_anexos)")
        
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
                        Text("\(materia.nome_sala)")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .bold()
                            .padding(.leading) // Adds space to the left of the text
                        Spacer() // Pushes the text to the left side
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
        MateriaView(materia: Materia(id: 1,nome_sala: "Marcos", ImageName: "ImageFill", has_entered: true, nome_responsavel: "Alisson Bonnet", hora_disponivel: "18h50m", array_alunos: ["Student1", "Student2"], description: "Ola friends",
                                     img_anexos: "lua_image"))
    }
}
