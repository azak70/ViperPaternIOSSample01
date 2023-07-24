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
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
        AnasayfaRouter.createModule(ref: self)
        veritabanikopyala()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya döndü")
        
        anasayfaPresenterNesnesi?.kisileriYukle()
    }
    func veritabanikopyala()
    {
        let bundleyolu = Bundle.main.path(forResource: "rehber", ofType: "sqlite")
        let hedefyol = NSSearchPathForDirectoriesInDomains( .documentDirectory, .userDomainMask, true).first!
        let filemanager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefyol).appendingPathComponent("rehber.sqlite")
        if filemanager.fileExists(atPath: kopyalanacakYer.path)
        {
            print("Veri Tabanı dizinde zaten var !")
        }
        else
        {
            do {
                try filemanager.copyItem(atPath: bundleyolu!, toPath: kopyalanacakYer.path)
            }
            catch {}
        }
    }


}
extension AnasayfaVC:PresenterToViewAnasayfaProtocol
{
    func vieweVeriGonder(kisilerListesi: Array<Kisiler>) {
        self.KisilerListe=kisilerListesi
        self.tableview.reloadData()
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}
 
extension AnasayfaVC :UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.Ara(aramaKelimesi: searchText)
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
        cell.lbadsoyad.text = kisi.kisi_ad
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
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad ?? "") silinsin mi ?" , preferredStyle: .actionSheet)
            
            let evetAction = UIAlertAction(title: "Evet", style: .cancel) { action in
                self.anasayfaPresenterNesnesi?.Sil(kisiId: Int(kisi.kisi_id!)!)
            }
            let cancelAction = UIAlertAction(title: "iPtal", style: .destructive, handler: {action in}   )
            alert.addAction(evetAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
        
    }
    
    
    
}
