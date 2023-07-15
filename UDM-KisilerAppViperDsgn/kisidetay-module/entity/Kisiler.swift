//
//  Kisiler.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 30.05.2023.
//

import Foundation
import UIKit
class Kisiler {
    var KisiAd : String?
    var KisiTel : String?
    var KisiId :Int
    init(kisiad:String?,kisitel:String?,kisiid:Int){
        self.KisiAd=kisiad
        self.KisiId=kisiid
        self.KisiTel=kisitel
    }
}
