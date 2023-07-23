//
//  AnasayfaInteractor.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
class AnasayfaInteractor:PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    let db:FMDatabase?
    init(){
        let hedefyol = NSSearchPathForDirectoriesInDomains( .documentDirectory, .userDomainMask, true).first!
        
        let veritabaniURL = URL(fileURLWithPath: hedefyol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path:veritabaniURL.path)
        
    }
    func tumKisileriAl() {
        var liste = [Kisiler]()
        db?.open()
        do{
            let rs = try db!.executeQuery("select * from kisiler",values :nil)
            while rs.next() {
                let kisi = Kisiler(kisiad: rs.string(forColumn: "kisi_ad"), kisitel: rs.string(forColumn:"kisi_tel"), kisiid: Int(rs.int(forColumn:"kisi_id")))
                liste.append(kisi)
            }
        }
        catch {
            
        }
        db?.close()
        anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
    }
    
    func kisiAra(aramaKelimesi: String) {
        print("Search Text : \(aramaKelimesi)")
        var liste = [Kisiler]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%'", values: nil)
            while rs.next() {
                let kisi = Kisiler(kisiad: rs.string(forColumn: "kisi_ad"), kisitel: rs.string(forColumn: "kisi_tel"), kisiid: Int(rs.int(forColumn: "kisi_id")))
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
