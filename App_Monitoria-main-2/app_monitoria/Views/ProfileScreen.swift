import SwiftUI

struct ProfileScreen: View {
    
    @Binding var name: String
    @State private var showNameInputView = false
    
    var body: some View {
        ScrollView(.vertical){
            VStack {
                Text("Perfil de usuário")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .offset(x: 0, y: -6)
                
            }
            VStack{
                ZStack {
                    Image("banner-fundo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    // setando a posicao do banner de fundo
                        .frame(width: 512,
                               height: 240,
                               alignment: .bottomLeading)
                        .offset(x: 0, y:-40)
                    // A foto de perfil do usuario
                    Image("person-icon")
                        .resizable()
                    //.scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 100,
                               height: 100,
                               alignment: .bottom)
                        .offset(x:10, y:80)
                }
                VStack {
                    // Setando a posicao dessa porra mais pra baixo
                        //.padding()
                    Text("\(name)")
                        .padding(1)
                        .font(.system(size: 24))
                    Text("Aluno")
                        .bold()
                        .padding(1)
                }
                // Stack sobre o aluno
                .padding(10)
                VStack {
                    Text("Sobre mim").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Meu nome é Mateus Almeida. Curso o 4 período de Informática no IFCE - Campus Fortaleza")
                                .padding() // Adiciona um espaço interno ao redor do texto
                                .background(Color.white) // Define a cor de fundo da caixa
                                .cornerRadius(10) // Adiciona cantos arredondados à caixa
                                .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5) // Adiciona a sombra
                                //.padding() // Adiciona um espaçamento externo
                                .frame(width: 380, height: 110)
                }
                // Como os icones estão dispostos de forma horizonral
                // então eu vou colocar as três imagens numa HStack
                VStack{
                    Text("Redes sociais:").font(.title)
                    HStack{
                        
                        Image("twitter-icon")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Image("instagram-icon")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
                
            }

        }
    }
}

#Preview {
    NavigationStack {
        ProfileScreen(name: .constant("Leandro"))
    }
}
