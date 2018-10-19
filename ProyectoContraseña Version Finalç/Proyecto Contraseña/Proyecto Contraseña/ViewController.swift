//
//  ViewController.swift
//  Proyecto Contraseña
//
//  Created by MacBook on 15/10/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Caja: UITextField!
    @IBOutlet weak var Contraseña: UITextField!
    
    var listaUsuarios2: ListaUsuarios = ListaUsuarios(lista: [], conectado: false)
    var usuarioRegistrar: [Usuario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuarioRegistrar = listaUsuarios2.lista
        print(listaUsuarios2.lista)
        print(usuarioRegistrar)
     //segunda parte para que no se resetee el arreglo cada vez que se registre un usario, los print son para saber que esta funcionando y por motivo de pruebas
    }
    
    
    @IBAction func Guardar(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        var data: Usuario = Usuario(nombre: "", contraseña: "")
        data.nombre = Caja.text!
        data.contraseña = Contraseña.text!
        
        usuarioRegistrar.append(data)
        
        defaults.set(try? PropertyListEncoder().encode(usuarioRegistrar), forKey:"lista")
        
    }

}

