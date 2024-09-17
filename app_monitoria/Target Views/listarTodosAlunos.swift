import SwiftUI

struct listarTodosAlunos: View {
    
    @State var alunos_monitoria: [String]
    
    var body: some View {
        List {
            ForEach(alunos_monitoria, id: \.self) { aluno in
                Text(aluno)
            }
        }
    }
}

#Preview {
    listarTodosAlunos(alunos_monitoria: ["Student1", "Student2"])
}
