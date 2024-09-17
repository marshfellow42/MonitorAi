import SwiftUI

struct TelaInicial: View {
    @AppStorage("darkMode") private var darkMode = false
    @State private var go_to_settings: Bool = false
    @State private var searchText = ""
    var is_monitor = UserData.shared.list_users[0].is_monitor
    
    @StateObject private var salaData = SalaData.shared // Usar o singleton compartilhado

    var body: some View {
        NavigationStack {
            if(is_monitor){
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
                    
                    if searchText.isEmpty {
                        ForEach(salaData.list_salas.filter { ($0.matricula_responsavel == "20222011060999") }) { monitoria in
                            MonitoriaViewMain(monitoria: monitoria)
                        }
                        ForEach(salaData.list_salas.filter { $0.has_entered }) { monitoria in
                            MonitoriaView(monitoria: monitoria)
                        }
                    } else {
                        ForEach(salaData.list_salas.filter { ($0.matricula_responsavel == "20222011060999" && is_monitor) && $0.nome_sala.lowercased().contains(searchText.lowercased()) }) { monitoria in
                            MonitoriaViewMain(monitoria: monitoria)
                        }
                        ForEach(salaData.list_salas.filter { $0.has_entered && $0.nome_sala.lowercased().contains(searchText.lowercased()) }) { monitoria in
                            MonitoriaView(monitoria: monitoria)
                        }
                    }
                    
                    if salaData.list_salas.filter({ $0.has_entered || ($0.matricula_responsavel == "20222011060999") }).isEmpty {
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
