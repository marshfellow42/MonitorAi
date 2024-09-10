//
//  User.swift
//  app_monitoria
//
//  Created by found on 06/09/24.
//

import Foundation

struct User: Identifiable {
    var id: Int
    var matricula: String
    var name: String
    var is_monitor: Bool
    var user_description: String
}
