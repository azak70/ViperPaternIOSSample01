//
//  KisiDetayPresenter.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
class KisiDetayPresenter:ViewToPresenterKisiDetayProtocol{
    var kisidetayIneractor: PresenterToInteractorKisiDetayProtocol?
    
    func guncelle(kisiId: Int, kisiAd: String, kisiTel: String) {
        kisidetayIneractor?.kisiGuncelle(kisiId: kisiId, kisiAd: kisiAd, kisiTel: kisiTel)
    }
    
    
}
