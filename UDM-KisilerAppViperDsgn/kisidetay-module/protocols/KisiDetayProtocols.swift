//
//  KisiKayitProtocols.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
protocol ViewToPresenterKisiDetayProtocol {
    var kisidetayIneractor : PresenterToInteractorKisiDetayProtocol?{get set}
    func guncelle(kisiId:Int,kisiAd:String ,kisiTel:String)
}
 
protocol PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisiId:Int,kisiAd:String ,kisiTel:String)
    
}
protocol PresenterToRouterKisiDetayProtocol {
    static func createModule(ref:KisiDetayVC)
}
