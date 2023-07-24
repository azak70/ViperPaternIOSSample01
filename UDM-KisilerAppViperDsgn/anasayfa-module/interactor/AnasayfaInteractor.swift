//
//  AnasayfaInteractor.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
import Alamofire
class AnasayfaInteractor:PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    let db:FMDatabase?
    let isAlamofire = true;
    init(){
        if(!isAlamofire){
        let hedefyol = NSSearchPathForDirectoriesInDomains( .documentDirectory, .userDomainMask, true).first!
        
        let veritabaniURL = URL(fileURLWithPath: hedefyol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path:veritabaniURL.path)
        }
        else
        {
            db=nil;
        }
    }
    func tumKisileriAl() {
        if(!isAlamofire){
        var liste = [Kisiler]()
        db?.open()
        do{
            let rs = try db!.executeQuery("select * from kisiler",values :nil)
            while rs.next() {
                let kisi = Kisiler(kisiad: rs.string(forColumn: "kisi_ad"), kisitel: rs.string(forColumn:"kisi_tel"), kisiid: (rs.string(forColumn:"kisi_id")))
                liste.append(kisi)
            }
        }
        catch {
            
        }
        db?.close()
        anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        }
        else {
            
            AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get).response{response in
                if let data = response.data {
                    do {
                        let cevap = try JSONDecoder().decode(KisilerCevap.self,from:data)
                        if let liste = cevap.kisiler {
                            self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
                        }
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
        }
    }
    
    func kisiAra(aramaKelimesi: String) {
        print("Search Text : \(aramaKelimesi)")
        var liste = [Kisiler]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%'", values: nil)
            while rs.next() {
                let kisi = Kisiler(kisiad: rs.string(forColumn: "kisi_ad"), kisitel: rs.string(forColumn: "kisi_tel"), kisiid: (rs.string(forColumn: "kisi_id")))
                liste.append(kisi)
            }
        }
        catch {}
        db?.close()
        anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
    }
    
    func kisiSil(kisiId: Int) {
        db?.open()
        do{
            try db?.executeUpdate("DELETE FROM kisiler where kisi_id = ? ", values: [kisiId])
            tumKisileriAl()
        }
        catch {}
        db?.close()
            print("\(kisiId) silindi. ")
    }
    
    
}
