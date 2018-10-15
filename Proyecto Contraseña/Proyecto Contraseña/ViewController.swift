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
    
    var listaUsuarios: ListaUsuarios = ListaUsuarios(lista: [], conectado: false)
    var usarioRegistrar: Usuario = Usuario(nombre: "", contraseña: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        if let dato = defaults.object(forKey: "lista")
            as? ListaUsuarios{
            Caja.text = dato.lista[0].nombre
        }else{
            Caja.text = "No hay dato guardado"
        }
        
    }
    
    
    @IBAction func Guardar(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        var data = usarioRegistrar
        data.nombre = Caja.text!
        data.contraseña = Contraseña.text!
        
        listaUsuarios.lista.append(data)
        
        defaults.set(listaUsuarios, forKey: "lista")
    }

}

