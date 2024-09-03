import SwiftUI

struct LoginScreen: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showInitialScreen: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack {
                    Spacer()
                    
                    TextField("Username", text: $username)
                        Divider()
                            .frame(maxHeight: 5)
                            .background(Color.black)
                            .cornerRadius(25)
                    
                    TextField("Password", text: $password)
                        Divider()
                            .frame(maxHeight: 5)
                            .background(Color.black)
                            .cornerRadius(25)
                    
                    Spacer()
                }
                // .frame(maxHeight: 150)
                .padding(.horizontal, 10)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                // Spacer(minLength: 4)
                
                Button {
                    showInitialScreen = true
                    } label: {
                        Text("Login")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 11).fill(username.isEmpty || password.isEmpty ? .gray : .blue)
                            )
                            .foregroundStyle(.white)
                }
                .disabled(username.isEmpty)
                .disabled(password.isEmpty)
                
                .navigationDestination(isPresented: $showInitialScreen) {
                    ContentView(name_global: .constant(username))
                }
                
                Spacer()
                
            }
            .navigationTitle("Enter in your account")
        }
    }
}

#Preview {
    LoginScreen()
}
