//
//  Usuario.swift
//  Proyecto Contraseña
//
//  Created by MacBook on 15/10/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import Foundation

struct Usuario {
    var nombre: String
    var contraseña: String
}

struct ListaUsuarios {
    var lista: [Usuario]
    var conectado: Bool
}
