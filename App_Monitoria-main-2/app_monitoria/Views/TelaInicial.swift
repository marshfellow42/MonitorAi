import SwiftUI

struct TelaInicial: View {
    @AppStorage("darkMode") private var darkMode = false
    @State private var go_to_settings: Bool = false
    @State private var searchText = ""
    
    @StateObject private var salaData = SalaData.shared // Usar o singleton compartilhado

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(salaData.list_salas.filter { $0.has_entered }) { materia in
                        MateriaView(materia: materia)
                    }
                    
                    if salaData.list_salas.filter({ $0.has_entered }).isEmpty {
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
