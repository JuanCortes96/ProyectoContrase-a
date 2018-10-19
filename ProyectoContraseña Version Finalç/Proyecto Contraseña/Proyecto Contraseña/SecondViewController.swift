//
//  SecondViewController.swift
//  Proyecto Contraseña
//
//  Created by Macbook on 19/10/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var contraseña: UITextField!
    @IBOutlet weak var estadoInicioSesion: UILabel!
    
    var listaUsuarios1: ListaUsuarios = ListaUsuarios(lista: [], conectado: false)
    var usuarioIntentaEntrar: Usuario = Usuario(nombre: "", contraseña: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*if listaUsuarios1.conectado == true {
            performSegue(withIdentifier: "entrar", sender: Any?.self)
        }
        print(listaUsuarios1.conectado)
         Esto no funciona, supongo que la lista de usuarios se resetea cada vez que se ejecuta el programa y debe ser guardada en userdefualts o al menos guardar su propiedad "conectado" pero no encuentro la forma de guardar un dato en userdefaults sin borrar el que ya tengo ni tampoco de guardar una estructura con las caracteristicas de ListaUsuarios*/
        
        let defaults = UserDefaults.standard
        
        if let data = defaults.value(forKey:"lista") as? Data {
            let listita = try? PropertyListDecoder().decode(Array<Usuario>.self, from: data)
            if listita != nil{
                nombreUsuario.text = listita![0].nombre
            }else{
                nombreUsuario.text = "No hay dato guardado"
            }
            print(listita!)//para comprobar que hay algo guardado
            listaUsuarios1.lista = listita!
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "registrarse"{
            let destino = segue.destination as! ViewController
            destino.listaUsuarios2 = listaUsuarios1
            //primera parte para que no se resetee el arreglo cada vez que se registra un usuario
        }

    }
    
    
    @IBAction func revisarEntrada(_ sender: UIButton) {
        usuarioIntentaEntrar.nombre = nombreUsuario.text!
        usuarioIntentaEntrar.contraseña = contraseña.text!
        var entradaExitosa: Bool = false
        
        for posicion in listaUsuarios1.lista{
            if posicion.nombre == usuarioIntentaEntrar.nombre && posicion.contraseña == usuarioIntentaEntrar.contraseña{
                entradaExitosa = true
            }
        }
        
        if (entradaExitosa == true){
            listaUsuarios1.conectado = true
            performSegue(withIdentifier: "entrar", sender: Any?.self)
        }else{
            estadoInicioSesion.text = "Aun no has iniciado correctamente"
        }
        
        //se pone en un action por que de otro modo se complicaria negar el segue desde el prepare directamente
    }
    
    @IBAction func unwindSecondView( segue: UIStoryboardSegue){
        if let origin = segue.source as? ViewController{
            let data = origin.listaUsuarios2
            listaUsuarios1 = data
        }
    }
    
    @IBAction func unwindThirdView( segue: UIStoryboardSegue){
 
        listaUsuarios1.conectado = false
        contraseña.text! = ""
    }



}
