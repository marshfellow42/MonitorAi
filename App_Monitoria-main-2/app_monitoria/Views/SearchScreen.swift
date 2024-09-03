import SwiftUI

struct SearchScreen: View {
    @State private var searchText = ""
    @StateObject private var salaData = SalaData.shared // Usar o singleton compartilhado

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(salaData.list_salas.filter { !$0.has_entered }) { materia in
                        MateriaView(materia: materia)
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
