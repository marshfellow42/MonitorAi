import SwiftUI

struct UserSheet: View {
    @StateObject private var userData = UserData.shared
    
    let width_number = 350.0
    let height_number = 120.0
    let corner_radius_number = 20.0
    let image = Image("ImageFill")
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(userData.list_users) { usuario in
                    Button(action: {
                        UserApp.shared.user_app[0] = usuario
                        
                        // Debugging output
                        print(usuario.matricula)
                        print(usuario.name)
                        print(usuario.user_description)
                        print(usuario.is_monitor)
                        print(UserApp.shared.user_app[0])
                        
                    }, label: {
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
                                        
                                        Text(usuario.is_monitor ? "Monitor" : "Aluno")
                                            .font(.title3)
                                            .bold()
                                        Text(" ")
                                        Text("\(usuario.matricula)")
                                            .underline()
                                            .font(.title3)
                                            .bold()
                                    }
                                    .fontWeight(.regular)
                                    .foregroundStyle(.white)
                                }
                                .padding(.leading, 20)
                                Spacer()
                                
                                Image("icon-monitoria") // ICON - IMAGEM MENOR
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            }
                            .frame(width: width_number)
                        }
                    })
                    .padding(.vertical, 8)
                }
                .navigationTitle("Contas: ")
            }
        }
    }
}

#Preview {
    UserSheet()
}
