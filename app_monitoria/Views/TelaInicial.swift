import SwiftUI

struct TelaInicial: View {
    @StateObject private var userApp = UserApp.shared
    @AppStorage("darkMode") private var darkMode = false
    @State private var go_to_settings: Bool = false
    @State private var searchText = ""
   
//    ForEach(salasUser.salas_user.filter { $0.matricula == userApp.user_app[0].matricula }) { monitoria in
//        // Usar o idSala da monitoria atual para filtrar as salas
//        let idSala = monitoria.idSala
//        
//        // Filtrar as salas correspondentes ao idSala
//        let salasCorrespondentes = salaData.list_salas.filter { $0.id == idSala }
//
//        ForEach(salasCorrespondentes) { sala in
//            MonitoriaViewMain(monitoria: sala)}
//    }
    
    @StateObject private var salaData = SalaData.shared // Usar o singleton compartilhado

    var body: some View {
        NavigationStack {
            if(userApp.user_app[0].is_monitor){
                Button {
                    NavigationLink(destination: RankScreen()) {
                        Text("Olá")
                    }
                } label: {
                    Label("Nova Sala", systemImage: "plus.app.fill")
                    
                }
            }
            

            ScrollView {
                VStack {
                    
                    if searchText.isEmpty && userApp.user_app[0].name == "Leandro"{
                        ForEach(salaData.list_salas.filter { ($0.matricula_responsavel == "20222011060999" ) }) { monitoria in
                            MonitoriaViewMain(monitoria: monitoria)
                        }
                        ForEach(salaData.list_salas.filter { $0.has_entered && $0.array_alunos.contains("Leandro") }) { monitoria in
                            MonitoriaView(monitoria: monitoria)
                        }

                    } else if searchText.isEmpty {
                        ForEach(salaData.list_salas.filter { ($0.matricula_responsavel == "20222011060999" ) }) { monitoria in
                            MonitoriaViewMain(monitoria: monitoria)
                        }
                        ForEach(salaData.list_salas.filter { $0.has_entered && $0.array_alunos.contains("Matues Grande") }) { monitoria in
                            MonitoriaView(monitoria: monitoria)
                        }
                        
                    } else {
                        ForEach(salaData.list_salas.filter { ($0.matricula_responsavel == "20222011060999" && userApp.user_app[0].is_monitor) && $0.nome_sala.lowercased().contains(searchText.lowercased()) }) { monitoria in
                            MonitoriaViewMain(monitoria: monitoria)
                        }
                        ForEach(salaData.list_salas.filter { $0.has_entered && $0.nome_sala.lowercased().contains(searchText.lowercased()) }) { monitoria in
                            MonitoriaView(monitoria: monitoria)
                        }
                    }
                    
                    if salaData.list_salas.filter({ $0.has_entered || ($0.matricula_responsavel == "20222011060999") && userApp.user_app[0].name == "Leandro" }).isEmpty {
                        Text("Não está em nenhuma sala!")
                    } else if salaData.list_salas.filter({ $0.has_entered || ($0.matricula_responsavel == "20222011060999") && userApp.user_app[0].name == "Mateus Grande" }).isEmpty {
                        Text("Não está em nenhuma sala!")
                    }
                    
                    Spacer()
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Salas")
            .toolbar {
                Button(action: {
                    go_to_settings = true
                }, label: {
                    Label("Store", systemImage: "gear")
                })
            }
            .sheet(isPresented: $go_to_settings) {
                SettingsSheet()
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(50)
                    .presentationDragIndicator(.visible)
            }
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    TelaInicial()
}
