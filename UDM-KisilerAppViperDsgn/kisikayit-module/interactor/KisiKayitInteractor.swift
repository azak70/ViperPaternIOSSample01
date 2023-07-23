//
//  KisiKayitInteractor.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
class KisiKayitInteractor:PresenterToInteractorKisiKayitProtocol
{
    let db:FMDatabase?
    init(){
        let hedefyol = NSSearchPathForDirectoriesInDomains( .documentDirectory, .userDomainMask, true).first!
        
        let veritabaniURL = URL(fileURLWithPath: hedefyol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path:veritabaniURL.path)
        
    }
    func kisiEkle(kisiAd: String, kisiTel: String) {
        db?.open()
        do{
            try db?.executeUpdate("INSERT INTO kisiler(kisi_ad,kisi_tel)  values (?,?) ", values: [kisiAd,kisiTel])
            print("kisi ad : \(kisiAd)- Kisi tel : \(kisiTel) eklendi. ")
             
        }
        catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
