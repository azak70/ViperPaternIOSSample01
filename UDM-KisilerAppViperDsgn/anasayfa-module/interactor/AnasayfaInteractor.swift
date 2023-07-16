//
//  AnasayfaInteractor.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
class AnasayfaInteractor:PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisileriAl() {
        var liste = [Kisiler]()
        let k1 = Kisiler(kisiad: "Ahmet", kisitel: "9555553234", kisiid: 1)
        let k2 = Kisiler(kisiad: "Mehmet", kisitel: "3322332323", kisiid: 2)
        liste.append(k1)
        liste.append(k2)
        anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
    }
    
    func kisiAra(aramaKelimesi: String) {
        print("Search Text : \(aramaKelimesi)")
    }
    
    func kisiSil(kisiId: Int) {
            print("\(kisiId) silindi. ")
    }
    
    
}
