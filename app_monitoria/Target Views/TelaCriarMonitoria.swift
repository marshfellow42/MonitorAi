import SwiftUI

struct TelaCriarMonitoria: View {
    
    @State private var algumacoisa: String = ""
    @State private var nomeDaMonitoria: String = ""
    @State private var materia: String = ""
    @State private var descricao: String = ""
    
    @State private var horarioInicio = Date.now
    @State private var horarioFinal = Date.now
    @State private var monitores: String = ""
    
    
    
    var body: some View {
        NavigationStack{
            
            VStack{}
                .navigationTitle("Criar monitoria")
                .navigationBarTitleDisplayMode(.inline)
                .frame(width:60)
            
            ScrollView{
                VStack{
                    Text("CABEÇALHO?")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.gray)
                        .frame(width: 300, alignment: .leading)
                    
                    //.padding()
                    
                    VStack{
                        secaoField(nome_da_seccao: "Nome da sala", variavel: $nomeDaMonitoria)
                        
                        Divider()
                            .frame(width: 300)
                        
                        secaoField(nome_da_seccao: "Materia", variavel: $materia)
                        
                        Divider()
                            .frame(width: 300)
                        
                        descricaoField(nome_da_seccao: "Descrição", variavel: $descricao)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.1))
                    )
                }
                
                .padding(.bottom, 26)
                
                VStack{
                    Text("INFORMAÇÕES??")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.gray)
                        .frame(width: 300, alignment: .leading)
                    
                    VStack{
                        camp(nome_da_seccao: "Horário")
                        
                        Divider()
                            .frame(width: 300)
                        
                        camp(nome_da_seccao: "Dias")
                        
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.1))
                    )
                    
                }
                .padding(.bottom, 20)
                
                
                
                Text("Criar sala")
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.green)
                    )
                
                
            }
        }
    }
        
    
    // FUNCAO DE CRIAR O CAMPO DE DESCRICAO --------------------
    func descricaoField(nome_da_seccao: String, variavel: Binding<String>) -> some View {
        VStack{
            HStack{
                
                Text(nome_da_seccao)
                    .padding(.horizontal, 10)
                    .frame(width: 250,alignment: .leading)
                
                Text("Editar")
                
            }
            .frame(width: 340, alignment: .leading)
            
            TextEditor(text: variavel)
                .scrollContentBackground(.hidden)
                .frame(width:320, height: 100)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 320)
                )
                .cornerRadius(10)
                .padding(.bottom, 10)
        }
        .padding(.vertical, 5)
        .frame(width: 340, alignment: .leading) // frame da vstack
        
    }
    
    // FUNCAO DE CRIAR OS CAMPOS -----------------------
    func secaoField(nome_da_seccao: String, variavel: Binding<String>) -> some View {
        
        HStack{
            VStack/*(alignment: .leading)*/{
                
                Text(nome_da_seccao)
                    .padding(.horizontal, 10)
                    .frame(width: 250,alignment: .leading)
                
                TextField(text: variavel, prompt: Text("Campo obrigatorio")) {}
                    .padding(.horizontal, 10)
                    .frame(width: 250, alignment: .leading)
                
            }
            
            Text("Editar")
        }
        .padding(.vertical, 5)
        .frame(width: 340, alignment: .leading) // frame da vstack
        
    }
    
    // FUNCAO DE CRIAR OS HORARIOS E PA ------------------------
    func camp (nome_da_seccao: String) -> some View{
        VStack{
            HStack{
                Text(nome_da_seccao)
                    .padding(.horizontal, 10)
                    .frame(width: 250,alignment: .leading)
                
                Text("Editar")
            }
            
            VStack{
                HStack{
                    Text("Inicio")
                        .frame(width: 60, alignment: .trailing)
                    DatePicker("Hora", selection: $horarioInicio, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .frame(width: 200)
                
                HStack{
                    Text("Fim")
                        .frame(width: 60, alignment: .trailing)
                    DatePicker("Hora", selection: $horarioInicio, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .frame(width: 200)
                
            }
        }
        .padding(.vertical, 5)
        .frame(width: 340, alignment: .leading) // frame da vstack
    }
}

#Preview {
    TelaCriarMonitoria()
}
