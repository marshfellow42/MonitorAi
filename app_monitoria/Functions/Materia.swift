//
//  materia.swift
//  app_monitoria
//
//  Created by found on 13/08/24.
//

import Foundation

struct Materia: Identifiable {
    var id: Int
    var nome_sala: String
    var ImageName: String
    var has_entered: Bool
    var nome_responsavel: String
    var hora_disponivel: String
    var array_alunos: [String]
    var description: String
    var img_anexos: String
}

