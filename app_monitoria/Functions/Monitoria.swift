//
//  materia.swift
//  app_monitoria
//
//  Created by found on 13/08/24.
//

import Foundation

struct Monitoria: Identifiable {
    var id: Int
    var nome_sala: String
    var ImageName: String
    var has_entered: Bool
    var nome_responsavel: String
    var matricula_responsavel: String
    var hora_disponivel: String
    var array_alunos: [String]
    var description: String
    var img_anexos: String
    var array_messages: [String]
    var limit_students: Int
    var img_monitoria_photo: String
}

