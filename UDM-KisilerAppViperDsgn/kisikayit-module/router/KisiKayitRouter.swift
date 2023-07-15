//
//  KisiKayitRouter.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
class KisiKayitRouter : PresenterToRouterKisiKayitProtocol
{
    static func createModule(ref: KisiKayitVC) {
        ref.kisikayitPresenterNesnesi = KisiKayitPresenter()
        ref.kisikayitPresenterNesnesi?.kisikayitIneractor = KisiKayitInteractor()
    }
    
    
}
