//
//  ViewController.swift
//  NewProyectTvShow
//
//  Created by Luis Enrique Erazo Amador on 16/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Add struct ApiShow
     var showElement = [ShowElement]()
    
        
//    var cuentas = [Cuentas]()
    
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
        
        
        
        self.ShowDay(completion: { data in
            print("recibe \(data.count)")
            DispatchQueue.main.async {
                self.showElement = data
                self.tableView.reloadData()
            }
        })
        
        
    }
    func ShowDay(completion: @escaping ([ShowElement]) -> Void) {
        let url = URL(string: "https://api.tvmaze.com/schedule/web?date=2022-07-15")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                print(data)
                if let JSON = try? JSONDecoder().decode([ShowElement].self, from: data) {
                    DispatchQueue.main.async {
                        completion(JSON)
                       
                        return
                    }
                }
            }
        }.resume()
        
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func downloadImage(from url: URL, imagen: UIImageView) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() {
                imagen.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.showElement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCellShow
        
        let mapShow = self.showElement[indexPath.row]
        cell?.titleShow.text = mapShow.name
        
        //let url = URL(string: showElement[indexPath.row].image)
        
        //downloadImage(from: url, imagen: cell!.imageShow)


        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellSelected = self.showElement[indexPath.row]
        print(cellSelected)
        // instanciar siguiente controller y pasar cellSelected
    }
    
    func tableView(_ tableView: UITableView,leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
         {
             let favoriteAction = UIContextualAction(style: .normal, title:  "Favorite", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                 success(true)
                 })
            favoriteAction.backgroundColor = .systemGreen
             

             
                func alerta(titulo:String,mensaje: String){
                 let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
                 let continueAction = UIAlertAction(title: "Aceptar", style: .default) { [self] _ in
                     ViewController.delegatePurchase?.sendDataDeploymenteVC(data: showElement[indexPath.row])
                     
                     if ViewController.delegatePurchase == nil{
                         print("Holis")
                     }
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
                    
                    self.showElement.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    tableView.endUpdates()

                    print("Pruebas")
                }
                alert.addAction(continueAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
            
            
            if deleteAction == deleteAction{
                alerta(titulo: "¿Estas seguro que quieres eliminar el programa?", mensaje: " ")
            }

             return UISwipeActionsConfiguration(actions: [deleteAction])
         }
    
}



