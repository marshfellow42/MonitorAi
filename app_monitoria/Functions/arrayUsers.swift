import Foundation
import Combine

class UserData: ObservableObject {
    static let shared = UserData() // Singleton para acesso global
    
    @Published var list_users = [User]()
    
    private init() {
        initializeUsers()
    }
    
    func initializeUsers() {

        list_users.append(User(id: 1,
                               matricula: "20222011060999",
                               name: "Leandro",
                               is_monitor: false,
                               user_description: "Meu nome é Leandro. Curso o 4 período de Informática no IFCE - Campus Fortaleza",
                               array_salas: [1, 2, 3]
                              ))
        list_users.append(User(id: 2,
                               matricula: "20222011060904",
                               name: "Mateus Grande",
                               is_monitor: true,
                               user_description: "Meu nome é Mateus. Curso o 4 período de Informática no IFCE - Campus Fortaleza",
                               array_salas: [1, 2, 3]
                              ))

}
}
