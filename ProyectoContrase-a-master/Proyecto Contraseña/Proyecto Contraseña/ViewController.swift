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
        /*let defaults = UserDefaults.standard
        
        if let dato =          defaults.object(forKey: "lista")
            as? ListaUsuarios{
            Caja.text = dato.lista[0].nombre
        }else{
            Caja.text = "No hay dato guardado"
        } de esta manera no sirve*/
        
        /*if let data = defaults.value(forKey:"lista") as? Data {
            let lista = try? PropertyListDecoder().decode(Array<Usuario>.self, from: data)
            if lista != nil{
            Caja.text = lista![0].nombre
           }else{
            Caja.text = "No hay dato guardado"
           }
            print(lista!)
        }   esto es para leer pero aqui no se usa*/
        
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

