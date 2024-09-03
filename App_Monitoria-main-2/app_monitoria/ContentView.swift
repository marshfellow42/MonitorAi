import SwiftUI
import Foundation

struct ContentView: View {
    
    @Binding var name_global: String
    
    @AppStorage("darkMode") private var darkMode = false 
    
    var body: some View {
        NavigationView {
            TabView {
                TelaInicial()
                    .tabItem {
                        Label("Salas", systemImage: "studentdesk")
                    }
                /*
                 RankScreen()
                    .tabItem {
                        Label("Rank", systemImage: "trophy")
                    }
                 */
                SearchScreen()
                    .tabItem {
                        Label("Pesquisa", systemImage: "magnifyingglass")
                    }
                /*
                 StoreScreen()
                    .tabItem {
                        Label("Store", systemImage: "cart")
                    }
                 */
                ProfileScreen(name: .constant(name_global))
                    .tabItem {
                        Label("Perfil", systemImage: "person.circle.fill")
                    }
                
            }
            
            .preferredColorScheme(darkMode ? .dark : .light) // Apply the color scheme based on the state
                    
        }
    }
}

#Preview {
    ContentView(name_global: .constant("Leandro"))
}
