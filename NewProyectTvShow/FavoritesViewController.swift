//
//  FavoritesViewController.swift
//  NewProyectTvShow
//
//  Created by Luis Enrique Erazo Amador on 18/09/22.
//

import UIKit

class FavoritesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, GetDataDelegate {
    
    var PTitulo: String?
    var cuenta = [Cuentas]()

    
    
    @IBOutlet weak var tableFavorites: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableFavorites.register(UINib(nibName: "TableViewCellFavorites", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableFavorites.delegate = self
        self.tableFavorites.dataSource = self
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cuenta.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableFavorites.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCellFavorites
        let cuenta = self.cuenta[indexPath.row]
        //cell?.imgFavorites.image = UIImage(named: cuenta.)
        cell?.nameFavorites.text = cuenta.title
        return cell!
    }
    
    func sendDataDeploymenteVC(data: Cuentas) {
        print("Se ejecuto")
        PTitulo = data.title
        cuenta.append(Cuentas(title: PTitulo!))
        
    }
    



}
