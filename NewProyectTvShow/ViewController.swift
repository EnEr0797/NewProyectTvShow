//
//  ViewController.swift
//  NewProyectTvShow
//
//  Created by Luis Enrique Erazo Amador on 16/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Add struct ApiShow
     //var showElement = [ShowElement]()
    var delegateItm: GetDataDelegate!
    var cuentas = [Cuentas]()
    var cuenta: Cuentas?
    
    // Percistencia de datos
    private let myKey = "MY_KEY"

    static var delegatePurchase : GetDataDelegate!

    
    // Add tablevView

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Import view of my cell
        self.tableView.register(UINib(nibName: "TableViewCellShow", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        cuentas.append(Cuentas(title: "EA SPORTS™ FIFA 23 Ultimate Edition para PS4™ y PS5™"))
        
        self.ShowDay(completion: { data in
        })
        
        
    }
    func ShowDay(completion: @escaping ([Show]) -> Void) {
        let url = URL(string: "https://api.tvmaze.com/schedule/web?date=2022-07-15")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Show].self, from: data) {
                    DispatchQueue.main.async {
                        completion(messages)
                        print(data)
                        return
                    }
                }
            }
        }.resume()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        if let cuenta = cuenta {
            delegateItm.sendDataDeploymenteVC(data: cuenta)
        }
        
    }
    


    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cuentas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCellShow
        
        let mapShow = self.cuentas[indexPath.row]
        cell?.titleShow.text = mapShow.title

        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellSelected = self.cuentas[indexPath.row]
        print(cellSelected)
        // instanciar siguiente controller y pasar cellSelected
    }
    
    
// *********************************************** Función de eliminación directa************************
    
/*
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        func alerta(titulo:String,mensaje: String){
            let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
            let continueAction = UIAlertAction(title: "Aceptar", style: .default) { _ in
//              tableView.beginUpdates()
//                self.cuentas.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//                tableView.endUpdates()

                print("Pruebas")
            }
            alert.addAction(continueAction)
            self.present(alert, animated: true, completion: nil)
        }


        if editingStyle == .delete{
            alerta(titulo: "Añadido a favoritos", mensaje: "¡Fabulosa Elección!")
        }
    }
    
    
    
    */
    
    
    
// Función de agregar a favoritos**********************************************************//
    
    
    
//    func tableView(_ tableView: UITableView,trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
//        {
//            let favoriteAction = UIContextualAction(style: .normal, title:  "Favorite", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//                success(true)
//                })
//            favoriteAction.backgroundColor = .systemYellow
//
//            //***************************
//            func alerta(titulo:String,mensaje: String){
//                let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
//                let continueAction = UIAlertAction(title: "Aceptar", style: .default) { _ in
//
//                    print("Añadido a favoritos")
//                }
//                alert.addAction(continueAction)
//                self.present(alert, animated: true, completion: nil)
//            }
//
//            if favoriteAction == favoriteAction{
//                alerta(titulo: "Añadido a favoritos!", mensaje: "¡Excelente elección!")
//            }
//
//                return UISwipeActionsConfiguration(actions: [favoriteAction])
//        }
    
    
    func tableView(_ tableView: UITableView,leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
         {
             let favoriteAction = UIContextualAction(style: .normal, title:  "Favorite", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                 success(true)
                 })
             favoriteAction.backgroundColor = .systemYellow
             

             
             //***************************
             func alerta(titulo:String,mensaje: String){
                 let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
                 let continueAction = UIAlertAction(title: "Aceptar", style: .default) { [self] _ in

                     print("Añadido a favoritos")
                     //ViewController.delegatePurchase?.sendDataDeploymenteVC(data: Cuentas!)
                     //ViewController.delegatePurchase?.sendDataDeploymenteVC(data: cuentas!)

                 }
                 alert.addAction(continueAction)
                 self.present(alert, animated: true, completion: nil)
             }
             
             if favoriteAction == favoriteAction{
                 alerta(titulo: "Añadido a favoritos!", mensaje: "¡Excelente elección!")
             }

                 return UISwipeActionsConfiguration(actions: [favoriteAction])
         }

         
        
        
        func tableView(_ tableView: UITableView,trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
         
        {
             let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                 success(true)
                 
             })
            deleteAction.backgroundColor = .systemRed
            
            // Función Alerta*****************************
            
            func alerta(titulo:String,mensaje: String){
                let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
                let cancelAction = UIAlertAction (title: "Cancelar", style: .default, handler: nil)
                let continueAction = UIAlertAction(title: "Aceptar", style: .destructive) { [self] _ in
                  tableView.beginUpdates()
                    
                    UserDefaults.standard.removeObject(forKey: myKey)
                    UserDefaults.standard.synchronize()
                    
                    self.cuentas.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    tableView.endUpdates()

                    print("Pruebas")
                }
                alert.addAction(continueAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
            //*******************************************
            
            if deleteAction == deleteAction{
                alerta(titulo: "¿Estas seguro que quieres eliminar el programa?", mensaje: " ")
            }

             return UISwipeActionsConfiguration(actions: [deleteAction])
         }
    
     
    
            
 
}



