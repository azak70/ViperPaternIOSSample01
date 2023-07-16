//
//  AnasayfaProtocols.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
protocol ViewToPresenterAnasayfaProtocol
{
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol?{get set }
    var anasayfaView : PresenterToViewAnasayfaProtocol?{get set}
    
    func kisileriYukle()
    func Ara(aramaKelimesi:String)
    func Sil(kisiId:Int)
    
}

protocol PresenterToInteractorAnasayfaProtocol
{
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol?{get set}
    
    func tumKisileriAl()
    func kisiAra(aramaKelimesi:String)
    func kisiSil(kisiId:Int)
    
}

protocol InteractorToPresenterAnasayfaProtocol
{
    func presenteraVeriGonder(kisilerListesi:Array<Kisiler>)
}

protocol PresenterToViewAnasayfaProtocol
{
   func vieweVeriGonder(kisilerListesi:Array<Kisiler>)
}

protocol PresenterToRouterAnasayfaProtocol
{
    static func createModule(ref:AnasayfaVC)
}
