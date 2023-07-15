//
//  KisiKayitProtocols.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
protocol ViewToPresenterKisiKayitProtocol {
    var kisikayitIneractor : PresenterToInteractorKisiKayitProtocol?{get set}
    func kisiEkle(kisiAd:String ,kisiTel:String)
}
 
protocol PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisiAd:String ,kisiTel:String)
    
}
protocol PresenterToRouterKisiKayitProtocol {
    static func createModule(ref:KisiKayitVC)
}
