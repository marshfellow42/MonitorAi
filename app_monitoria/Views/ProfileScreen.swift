import SwiftUI

struct ProfileScreen: View {
    
    @State private var showNameInputView = false
    @StateObject private var userData = UserData.shared
    var name = UserData.shared.list_users[0].name
    var user_description = UserData.shared.list_users[0].user_description

    func createImageWithUrl(url: String, image_text: String) -> some View {
        Button(action: {
            if let link = URL(string: url), UIApplication.shared.canOpenURL(link) {
                UIApplication.shared.open(link)
            }
        }) {
            VStack {
                Image(image_text)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }

    
    var body: some View {
    
        VStack{
            VStack {
                Text("Perfil de usuário")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
            }
        ScrollView(.vertical){
            
            
                ZStack {
                    
                    Image("banner-monitoria")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    // setando a posicao do banner de fundo
                        .frame(width: 512,
                               height: 240,
                               alignment: .bottomLeading)
                    // A foto de perfil do usuario
                    Image("person-icon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
//                        .resizable()
//                        .scaledToFit()
//                        .aspectRatio(contentMode: .fit)
//                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                        .frame(width: 180,
//                               height: 180,
//                               alignment: .bottom)
                       .offset(y:70)
                }
                VStack {
                    // Setando a posicao dessa porra mais pra baixo
                        //.padding()
                    Text("\(name)")
                        .padding(1)
                        .font(.system(size: 24))
                        .offset(y:30)
                    Text("Aluno")
                        .bold()
                        .padding(1)
                        .offset(y:25)
                }
                // Stack sobre o aluno
                .padding(10)
                VStack {
                    Text("Sobre mim:")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: 200, height: 40, alignment: .leading)
                        .offset(x:-80, y: 10)
                    Text("\(user_description)")
                                .padding() // Adiciona um espaço interno ao redor do texto
                                .background(Color.white) // Define a cor de fundo da caixa
                                .foregroundStyle(.black)
                                .cornerRadius(10) // Adiciona cantos arredondados à caixa
                                .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5) // Adiciona a sombra
                                //.padding() // Adiciona um espaçamento externo
                                .frame(width: 380, height: 110)
                }
                // Como os icones estão dispostos de forma horizonral
                // então eu vou colocar as três imagens numa HStack
                VStack{
                    Text("Redes sociais:")
                        .font(.title)
                        .frame(width: 200, height: 40, alignment: .leading)
                        .offset(x:-80, y: 10)
                    
                    HStack{
                        
                        createImageWithUrl(url: "https://www.x.com/", image_text: "twitter-icon")
                            
                        
                        createImageWithUrl(url: "https://www.instagram.com/apple/", image_text: "instagram-icon")
                        
                        
                    }
                    .offset(x:-120, y: 10)
                }
                
            }

        }
    }
}
#Preview {
    NavigationStack {
        ProfileScreen()
    }
}
