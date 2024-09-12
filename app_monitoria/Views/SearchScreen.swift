import SwiftUI

struct SearchScreen: View {
    @State private var searchText = ""
    @StateObject private var salaData = SalaData.shared // Usar o singleton compartilhado

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if searchText.isEmpty {
                        ForEach(salaData.list_salas.filter { !$0.has_entered }) { monitoria in
                            MonitoriaView(monitoria: monitoria)
                        }
                    } else {
                        ForEach(salaData.list_salas.filter { !$0.has_entered && $0.nome_sala.contains(searchText) }) { monitoria in
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
