import Foundation
import Combine

class UserData: ObservableObject {
    static let shared = UserData() // Singleton para acesso global
    
    @Published var list_users = [User]()
    
    private init() {
        initializeUsers()
    }
    
    func initializeUsers() {
        // Evitar inicialização múltipla
        guard list_users.isEmpty else { return }

        list_users.append(User(id: 1,
                               matricula: "20222011060999",
                               name: "Leandro",
                               is_monitor: false,
                               user_description: "Meu nome é Leandro. Curso o 4 período de Informática no IFCE - Campus Fortaleza"
                              ))
        list_users.append(User(id: 2,
                               matricula: "20221011060320",
                               name: "Pedro Lucas",
                               is_monitor: false,
                               user_description: "Olá, eu gosto de jogar damas!"
                              ))
        list_users.append(User(id: 3,
                               matricula: "20201011060050",
                               name: "Mateus Almeida Torres Evangelista",
                               is_monitor: false,
                               user_description: "Sou aficcionado por computadores, idiomas e livros!"
                              ))
        list_users.append(User(id: 4,
                               matricula: "2022101106069",
                               name: "Samuel Filé dos Santos",
                               is_monitor: false,
                               user_description: "Eu gosto de proggramar na linguagem Python, gosto também de jogar"
                              ))

}
}
