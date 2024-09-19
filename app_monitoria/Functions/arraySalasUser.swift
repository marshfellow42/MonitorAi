import Foundation
import Combine

class SalasUser: ObservableObject {
    static let shared = SalasUser() // Singleton para acesso global
    
    @Published var salas_user = [Salas]()
    
    private init() {
        initializeUsers()
    }
    
    func initializeUsers() {
        // Evitar inicialização múltipla
        guard salas_user.isEmpty else { return }

        salas_user.append(Salas(id: 1,
                                idSala: 1,
                               matricula: "20222011060999"
                              ))
        salas_user.append(Salas(id: 2,
                                idSala: 2,
                               matricula: "20222011060999"
                              ))
        salas_user.append(Salas(id: 3,
                                idSala: 1,
                               matricula: "20222011060904"
                              ))
        salas_user.append(Salas(id: 4,
                                idSala: 2,
                               matricula: "20222011060904"
                              ))
}
}
