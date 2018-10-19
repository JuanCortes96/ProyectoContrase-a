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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        if let data = defaults.value(forKey:"lista") as? Data {
            let listita = try? PropertyListDecoder().decode(Array<Usuario>.self, from: data)
            if listita != nil{
                nombreUsuario.text = listita![0].nombre
            }else{
                nombreUsuario.text = "No hay dato guardado"
            }
            print(listita!)
            listaUsuarios1.lista = listita!
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "registrarse"{
            let destino = segue.destination as! ViewController
            destino.listaUsuarios2 = listaUsuarios1
            
        }
        
        /*if segue.identifier == "entrar"{
            let indexPath = TablaSupermercado.indexPathForSelectedRow
            let destino = segue.destination as! ThirdViewController
            destino.fromFirstView = secciones[(indexPath?.row)!]
            
            destino.carritoTres = carritoUno
        }*/
    }
    
    
    
    @IBAction func unwindSecondView( segue: UIStoryboardSegue){
        if let origin = segue.source as? ViewController{
            let data = origin.listaUsuarios2
            listaUsuarios1 = data
        }
    }
    
    @IBAction func unwindThirdView( segue: UIStoryboardSegue){
        /*if let origin = segue.source as? ThirdViewController{
            let data = origin.carritoTres
            carritoUno = data
        }*/
        listaUsuarios1.conectado = false
    }



}
