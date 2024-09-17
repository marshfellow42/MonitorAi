import SwiftUI
import Foundation

struct ContentView: View {
    
    @StateObject private var userData = UserData.shared
    var name = UserData.shared.list_users[0].name
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
                ProfileScreen()
                    .tabItem {
                        Label("Perfil", systemImage: "person.circle.fill")
                    }
                
            }
            
            .preferredColorScheme(darkMode ? .dark : .light) // Apply the color scheme based on the state
        }
    }
}

#Preview {
    ContentView()
}
