//
//  KisiKayitPresenter.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
class KisiKayitPresenter:ViewToPresenterKisiKayitProtocol {
    var kisikayitIneractor: PresenterToInteractorKisiKayitProtocol?
    
    func kisiEkle(kisiAd: String, kisiTel: String) {
        kisikayitIneractor?.kisiEkle(kisiAd: kisiAd, kisiTel: kisiTel)
    }
    
    
}
