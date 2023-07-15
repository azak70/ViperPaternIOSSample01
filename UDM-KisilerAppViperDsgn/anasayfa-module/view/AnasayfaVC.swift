//
//  ViewController.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 30.05.2023.
//

import UIKit

class AnasayfaVC: UIViewController {
var KisilerListe = [Kisiler]()
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
        let k1 = Kisiler(kisiad: "Ahmet", kisitel: "9555553234", kisiid: 1)
        let k2 = Kisiler(kisiad: "Mehmet", kisitel: "3322332323", kisiid: 2)
        KisilerListe.append(k1)
        KisilerListe.append(k2)
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya döndü")
        
        
    }


}
extension AnasayfaVC :UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search Text : \(searchText)"
        )
    }
}
extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return KisilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = KisilerListe[indexPath.row]
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! KisiTableViewCell
        cell.lbadsoyad.text = kisi.KisiAd
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = KisilerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableview.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let kisi = sender as? Kisiler
            let gidilecekVC = segue.destination as! KisiDetayVC
            gidilecekVC.kisi = kisi
        }
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let kisi = KisilerListe[indexPath.row]
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (contexttualAction , view, bool) in
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.KisiAd) silinsin mi ?" , preferredStyle: .actionSheet)
            
            let evetAction = UIAlertAction(title: "Evet", style: .cancel) { action in
                print("\(kisi.KisiAd ?? "-") silindi. ")
            }
            let cancelAction = UIAlertAction(title: "iPtal", style: .destructive, handler: {action in}   )
            alert.addAction(evetAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
        
    }
    
    
    
}