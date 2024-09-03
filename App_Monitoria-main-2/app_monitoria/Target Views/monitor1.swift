import SwiftUI

struct monitor1: View {
    
    let materia: Materia
    
    @Binding var nome_da_sala: String
    
    @State private var filter: Bool = false
    @State private var expand: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // The commented-out expandable menu code
                /*
                
                
                if expand {
                    Button(action: {
                        print("1")
                        self.expand.toggle()
                    }) {
                        Text("Button 1")
                            .padding()
                    }.foregroundStyle(.black)
                    Button(action: {
                        print("2")
                        self.expand.toggle()
                    }) {
                        Text("Button 2")
                            .padding()
                    }.foregroundStyle(.black)
                    Button(action: {
                        print("3")
                        self.expand.toggle()
                    }) {
                        Text("Button 3")
                            .padding()
                    }.foregroundStyle(.black)
                }
                */
                /*
                 func updateMateria(nomeSala: String) {
                     if let index = materias.firstIndex(where: { $0.nome_sala == nomeSala }) {
                         materias[index].has_entered = true
                     } else {
                         print("Materia with nome_sala '\(nomeSala)' not found.")
                     }
                 }
                 */
                
                /*
                 HStack() {
                 Text("Participar")
                     .fontWeight(.bold)
                 }.onTapGesture {
                     updateMateria(nomeSala: materia.nome_sala)
                 }
                 
                 */
                
                
            }
            .navigationTitle("\(nome_da_sala)")
            .toolbar {
                Button(action: {
                    filter = true
                }, label: {
                    Label("Store", systemImage: "line.3.horizontal.decrease.circle")
                })
            }
            .sheet(isPresented: $filter) {
                FilterSheet()
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(50)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    // Provide a sample Materia object for the preview
    let sampleMateria = Materia(
        id: 1,
        nome_sala: "Sample Room",
        ImageName: "sampleImage",
        has_entered: false,
        nome_responsavel: "Sample Responsible",
        hora_disponivel: "08:00 - 10:00",
        array_alunos: ["Student1", "Student2"],
        description: "Sample description",
        img_anexos: "lua_image"
    )

    return monitor1(materia: sampleMateria, nome_da_sala: .constant("Física"))
}
