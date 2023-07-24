//
//  Kisiler.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 30.05.2023.
//

import Foundation
import UIKit
class Kisiler :Codable { 
    var kisi_id : String?
    var kisi_ad : String?
    var kisi_tel :String?
    init(kisiad:String?,kisitel:String?,kisiid:String?){
        self.kisi_ad=kisiad
        self.kisi_id=kisiid
        self.kisi_tel=kisitel
    }
}
