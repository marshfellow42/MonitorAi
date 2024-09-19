import Foundation
import Combine

class UserApp: ObservableObject {
    static let shared = UserApp() // Singleton para acesso global
    
    @Published var user_app = [User]()
    
    private init() {
        initializeUsers()
    }
    
    func initializeUsers() {
        // Evitar inicialização múltipla
        guard user_app.isEmpty else { return }

        user_app.append(UserData.shared.list_users[0])
//        user_app.append(User(id: 1,
//                               matricula: "20222011060999",
//                               name: "Leandro",
//                               is_monitor: false,
//                               user_description: "Meu nome é Leandro. Curso o 4 período de Informática no IFCE - Campus Fortaleza"
//                              ))

}
}
