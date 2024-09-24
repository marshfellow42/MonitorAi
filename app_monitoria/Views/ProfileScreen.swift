import SwiftUI

struct ProfileScreen: View {
    @StateObject private var userApp = UserApp.shared
    @State private var showNameInputView: Bool = false
    @State private var go_to_settings: Bool = false
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
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    Text("Perfil de usuário")
                        .font(.title)
                        .bold()
                }
                VStack {
                    ZStack {
                        Image("banner-monitoria")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 512, height: 240, alignment: .bottomLeading)
                            .offset(x: 0, y: -40)
                        Image("person-icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 200, height: 200, alignment: .bottom)
                            .offset(y: 5)
                    }
                    VStack {
                        Text(userApp.user_app.first?.name ?? "N/A")
                            .padding(1)
                            .font(.system(size: 24))
                        Text("Aluno")
                            .bold()
                            .padding(1)
                    }
                    .padding(10)
                    VStack {
                        Text("Sobre mim")
                            .font(.title)
                        Text(userApp.user_app.first?.user_description ?? "N/A")
                            .padding()
                            .background(Color.white)
                            .foregroundStyle(.black)
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
                            .frame(width: 380, height: 110)
                    }
                    VStack {
                        Text("Redes sociais:")
                            .font(.title)
                        HStack {
                            createImageWithUrl(url: "https://www.x.com/", image_text: "twitter-icon")
                            createImageWithUrl(url: "https://www.instagram.com/apple/", image_text: "instagram-icon")
                        }
                    }
                }
            }
            .toolbar {
                Button(action: {
                    go_to_settings = true
                }) {
                    Label("Store", systemImage: "gear")
                }
            }
            .sheet(isPresented: $go_to_settings) {
                UserSheet()
                    .presentationDetents([.height(400)])
                    .presentationCornerRadius(50)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileScreen()
    }
}
