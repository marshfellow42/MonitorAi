import Foundation
import Combine

class SalaData: ObservableObject {
    static let shared = SalaData() // Singleton para acesso global
    
    @Published var list_salas = [Monitoria]()
    
    private init() {
        initializeSalas()
    }
    
    func initializeSalas() {
        // Evitar inicialização múltipla
        guard list_salas.isEmpty else { return }

        list_salas.append(Monitoria(id: 1,
                                  nome_sala: "Info é o poder",
                                  ImageName: "ImageFill",
                                  has_entered: false,
                                  nome_responsavel: "Alisson Bonnet",
                                  matricula_responsavel: "20222011060999",
                                  hora_disponivel: "18h50 - 19h50",
                                  array_alunos: ["Mateus Grande", "Filezinho", "Jenas", "Artur", "b", "c", "d", "e", "f", "g"],
                                  description: "sala que reune os verdadeiros interessados em informatica",
                                  img_anexos: "info_image",
                                  array_messages: ["Ola pessoal, sejam bem vindos a essa monitoria", "Entrem no grupo do telegram t.me/teste"],
                                  limit_students: 20))

        list_salas.append(Monitoria(id: 2,
                                  nome_sala: "Los Pollos Hermanos",
                                  ImageName: "ImageFill",
                                  has_entered: false,
                                  nome_responsavel: "Renata",
                                  matricula_responsavel: "20222011060100",
                                  hora_disponivel: "13h30 - 15h",
                                  array_alunos: ["Fatima", "Gonzada", "arpuroo", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q"],
                                  description: "sala de reuniao pra quem quer aprender mais de quimica galera!!",
                                  img_anexos: "quimica_image",
                                  array_messages: ["Ola pessoal, sejam bem vindos a essa monitoria", "Entrem no grupo do telegram t.me/teste"],
                                  limit_students: 20))

        list_salas.append(Monitoria(id: 3,
                                  nome_sala: "Fazedores de predios",
                                  ImageName: "ImageFill",
                                  has_entered: false,
                                  nome_responsavel: "Almir",
                                  matricula_responsavel: "20222011060101",
                                  hora_disponivel: "15h30 - 17h",
                                  array_alunos: ["Pires", "Gonzada", "arpuroo", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"],
                                  description: "os mestres da obra",
                                  img_anexos: "predio_image",
                                  array_messages: ["Ola pessoal, sejam bem vindos a essa monitoria", "Entrem no grupo do telegram t.me/teste"],
                                  limit_students: 40))

        list_salas.append(Monitoria(id: 4,
                                  nome_sala: "Rust",
                                  ImageName: "ImageFill",
                                  has_entered: false,
                                  nome_responsavel: "Taveira",
                                  matricula_responsavel: "20222011060102",
                                  hora_disponivel: "18h50 - 19h50",
                                  array_alunos: ["Arpuroo", "Aguinha", "Jenas", "Gonzada", "b", "c", "d"],
                                  description: "venha aprender rust mais facilmente!",
                                  img_anexos: "rust_image",
                                  array_messages: ["Ola pessoal, sejam bem vindos a essa monitoria", "Entrem no grupo do telegram t.me/teste"],
                                  limit_students: 50))
        list_salas.append(Monitoria(id: 5,
                                  nome_sala: "Matematicando",
                                  ImageName: "ImageFill",
                                  has_entered: false,
                                  nome_responsavel: "Gevane",
                                  matricula_responsavel: "20222011060103",
                                  hora_disponivel: "18h50 - 19h50",
                                  array_alunos: ["Vih", "a", "e", "f", "b", "c", "d"],
                                  description: "venha aprender rust mais facilmente!",
                                  img_anexos: "math_conj_image",
                                  array_messages: ["Ola pessoal, sejam bem vindos a essa monitoria", "Entrem no grupo do telegram t.me/teste"],
                                  limit_students: 60))
        list_salas.append(Monitoria(id: 6,
                                  nome_sala: "Matemática discreta",
                                  ImageName: "ImageFill",
                                  has_entered: false,
                                  nome_responsavel: "Isaac Newton",
                                  matricula_responsavel: "20222011060104",
                                  hora_disponivel: "18h50 - 19h50",
                                  array_alunos: ["Vih", "Samuel", "Kelwin", "Mateus", "Ana", "Steve Jobs", "Miguel"],
                                  description: "Monitoria de Matemática Discreta",
                                  img_anexos: "math_disc_image",
                                  array_messages: ["Ola pessoal, sejam bem vindos a essa monitoria", "Entrem no grupo do telegram t.me/teste"],
                                  limit_students: 70))
        list_salas.append(Monitoria(id: 7,
                                  nome_sala: "Monitoria de Lua",
                                  ImageName: "ImageFill",
                                  has_entered: false,
                                  nome_responsavel: "Roberto Ierusalimschy",
                                  matricula_responsavel: "20222011060105",
                                  hora_disponivel: "18h50 - 19h50",
                                  array_alunos: ["Mateus", "Roberto Ierusalimschy", "Mariana", "Evelyn", "Gaby", "Flávio", "Ruth", "Silvio Santos"],
                                  description: "Venha aprender desde o básico ao avançado em Lua",
                                  img_anexos: "lua_image",
                                  array_messages: ["Ola pessoal, sejam bem vindos a essa monitoria", "Entrem no grupo do telegram t.me/teste"],
                                  limit_students: 80))
    }
}
