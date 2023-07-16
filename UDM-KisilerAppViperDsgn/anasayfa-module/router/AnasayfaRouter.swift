//
//  AnasayfaRouter.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        ref.anasayfaPresenterNesnesi = presenter
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
}
