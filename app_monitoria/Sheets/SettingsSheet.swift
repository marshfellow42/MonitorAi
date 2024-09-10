import SwiftUI
import Foundation

struct SettingsSheet: View {
    
    @AppStorage("darkMode") private var darkMode = false
    @State private var flag_sair: Bool = false

    var body: some View {
        NavigationStack {
                
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "moon.circle.fill")
                    Toggle(isOn: $darkMode) {
                        Text("Modo Escuro")
                    }
                    .toggleStyle(SwitchToggleStyle())

                    Spacer()
                }
                .padding(.horizontal, 30)  // Adjust the horizontal padding as needed
                .frame(maxWidth: .infinity, alignment: .center)
                
                Divider()
                    .background(darkMode ? Color.white : Color.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                
                /*

                 
                 Button {
                     flag_sair = true
                 } label: {
                     HStack {
                         Image(systemName: "xmark.square.fill")
                         Text("Sair")
                         Spacer()
                         Image(systemName: "greaterthan")
                     }
                     .padding(.horizontal, 40)
                 }
                 .buttonStyle(PlainButtonStyle()) // Remove the default button style
                 .frame(maxWidth: .infinity, alignment: .center)
                 */
                
                Spacer()
            }
            .navigationTitle("Configurações")
        }
        .preferredColorScheme(darkMode ? .dark : .light) 
    }
}

#Preview {
    SettingsSheet()
}
