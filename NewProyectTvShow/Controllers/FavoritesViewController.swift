//
//  FavoritesViewController.swift
//  NewProyectTvShow
//
//  Created by Luis Enrique Erazo Amador on 18/09/22.
//

import UIKit

class FavoritesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, GetDataDelegate {
    
    var PTitulo: String?
    var cuenta = [ShowElement]()
    
    
    @IBOutlet weak var tableFavorites: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableFavorites.register(UINib(nibName: "TableViewCellFavorites", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableFavorites.delegate = self
        self.tableFavorites.dataSource = self
        
        ViewController.delegatePurchase = self
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cuenta.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableFavorites.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCellFavorites
        let cuenta = self.cuenta[indexPath.row]
        //cell?.imgFavorites.image = UIImage(named: cuenta.)
        cell?.nameFavorites.text = cuenta.name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
    func sendDataDeploymenteVC(data: ShowElement) {
        
//        print("Se ejecuto")
        PTitulo = data.name
//        PImage = data.image
        cuenta.append(data)
        
        DispatchQueue.main.async {

            self.tableFavorites.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        func alerta(titulo:String,mensaje: String){
            let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
            let cancelAction = UIAlertAction (title: "Cancelar", style: .default, handler: nil)
            let continueAction = UIAlertAction(title: "Aceptar", style: .destructive) { _ in
              tableView.beginUpdates()
                self.cuenta.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()

            }
            
            alert.addAction(continueAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }


        if editingStyle == .delete{
            alerta(titulo: "¿Deseas eliminar el capitulo de favoritos?", mensaje: " ")
        }
    }



}
