//
//  KisiKayitRouter.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 15.07.2023.
//

import Foundation
class KisiDetayRouter : PresenterToRouterKisiDetayProtocol{
    static func createModule(ref: KisiDetayVC) {
        ref.kisidetaypresenternesnesi = KisiDetayPresenter()
        ref.kisidetaypresenternesnesi?.kisidetayIneractor = KisiDetayInteractor() 
    }
    
    
}
