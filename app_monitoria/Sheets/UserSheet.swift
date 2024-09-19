import SwiftUI

struct UserSheet: View {
    @StateObject private var userData = UserData.shared
    
    let width_number = 350.0
    let height_number = 120.0
    
    let corner_radius_number = 20.0
    var body: some View {
        let image = Image("ImageFill")
                ForEach(userData.list_users) { usuario in
                    
                    
//                    var id: Int
//                    var matricula: String
//                    var name: String
//                    var is_monitor: Bool
//                    var user_description: String
                    
                                
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
                            VStack(alignment: .leading) {
                                Text("\(usuario.name)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                    .bold()
                                
                                VStack(alignment: .leading) {
                                    Text(" ")
                                    // Aqui está a correção com o operador ternário
                                    Text(usuario.is_monitor ? "É Monitor" : "Não é monitor")
                                    Text("\(usuario.matricula)")
                                }
                                .fontWeight(.regular)
                            }
                            .foregroundStyle(.white)
                            .padding(.leading, 20)
                            Spacer()
                            Button(action: {
                                
                                
                                UserApp.shared.user_app[0] = usuario
                                
                                
                                print(usuario.matricula)
                                print(usuario.name)
                                print(usuario.user_description)
                                print(usuario.is_monitor)
                                print(UserApp.shared.user_app[0]) // Debugging to check if it changes

                                
                                
                                
                            }, label: {
                                Image("icon-monitoria") // ICON - IMAGEM MENOR
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            })

                            
                        }
                        .frame(width: width_number)
                    }
                }
                .padding(.vertical, 8)
                .navigationTitle("Trocar de Usuário")
                
            }
        }

#Preview {
    UserSheet()
}

