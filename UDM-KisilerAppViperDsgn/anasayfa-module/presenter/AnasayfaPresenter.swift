//
//  AnasayfaPresenter.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
class   AnasayfaPresenter :ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func kisileriYukle() {
        anasayfaInteractor?.tumKisileriAl()
    }
    
    func Ara(aramaKelimesi: String) {
        anasayfaInteractor?.kisiAra(aramaKelimesi: aramaKelimesi)
    }
    
    func Sil(kisiId: Int) {
        anasayfaInteractor?.kisiSil(kisiId: kisiId)
    }
    
    
}
extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol
{
    func presenteraVeriGonder(kisilerListesi: Array<Kisiler>) {
        anasayfaView?.vieweVeriGonder(kisilerListesi: kisilerListesi)
    }
    
    
}
