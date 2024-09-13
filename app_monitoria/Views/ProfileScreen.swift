import SwiftUI

struct ProfileScreen: View {
    @AppStorage("darkMode") var darkMode = false
    @State private var showNameInputView = false
    @StateObject private var userData = UserData.shared
    var name = UserData.shared.list_users[0].name
    var user_description = UserData.shared.list_users[0
    ].user_description

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
        VStack {
            Text("Perfil de usuário")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            
        }
        ScrollView(.vertical){
            
            VStack{
                ZStack {
                    Image("banner-monitoria")
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
                        .frame(width: 180,
                               height: 180,
                               alignment: .bottom)
                        .offset(y:30)
                }
                VStack {
                    // Setando a posicao dessa porra mais pra baixo
                        //.padding()
                    Text("\(name)")
                        .bold()
                        .padding(1)
                        .font(.system(size: 24))
                    Text("Aluno")
                        .bold()
                        .padding(1)
                }
                // Stack sobre o aluno
                .padding(10)
                VStack {
                    HStack{
                        Text("Sobre mim:").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(width: 150, height: 50, alignment: .leading)
                    }.offset(x: -100, y: 8)
                    
                    
                    Text("\(user_description)")
                                .padding() // Adiciona um espaço interno ao redor do texto
                                .background(Color.white)
                                .foregroundStyle(.black)
                                .cornerRadius(10) // Adiciona cantos arredondados à caixa
                                .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5) // Adiciona a sombra
                                //.padding() // Adiciona um espaçamento externo
                                .frame(width: 380, height: 110)
                                .offset(y: -20)
                }
                // Como os icones estão dispostos de forma horizonral
                // então eu vou colocar as três imagens numa HStack
                VStack{
                    Text("Redes sociais:")
                        .font(.title)
                        .frame(width: 300, height: 80, alignment: .leading)
                        .offset(x:-25, y: -20)
                    
                    HStack{
                        // Finado twitterkkkk
                        createImageWithUrl(url: "https://www.x.com/", image_text: "twitter-icon")
                        
                        // Instagram
                        createImageWithUrl(url: "https://www.instagram.com", image_text: "instagram-icon")
                        
                        
                    }.frame(width: 110)
                        .offset(x:-112, y: -40)
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
