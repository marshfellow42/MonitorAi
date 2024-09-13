import SwiftUI

struct SearchScreen: View {
    @State private var searchText = ""
    @StateObject private var salaData = SalaData.shared // Usar o singleton compartilhado
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if searchText.isEmpty {
                        ForEach(salaData.list_salas.filter
                                { !$0.has_entered && !($0.matricula_responsavel == "20222011060999") }) { monitoria in
                            MonitoriaView(monitoria: monitoria)
                        }
                    } else {
                        ForEach(salaData.list_salas.filter {
                            !$0.has_entered && $0.nome_sala.lowercased().contains(searchText.lowercased()) && !($0.matricula_responsavel == "20222011060999")
                        }) { monitoria in
                            MonitoriaView(monitoria: monitoria)
                        }

                    }
                    
                    Spacer()
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Pesquisa")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    SearchScreen()
}
