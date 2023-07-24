//
//  KisiDetayVC.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 30.05.2023.
//

import UIKit

class KisiDetayVC: UIViewController {
    var kisidetaypresenternesnesi : ViewToPresenterKisiDetayProtocol?
    @IBOutlet weak var tfkisiad: UITextField!
    @IBOutlet weak var tfkisitel: UITextField!
    var kisi:Kisiler?
    override func viewDidLoad() {
        super.viewDidLoad()
        KisiDetayRouter.createModule(ref: self)

        if let _kisi = kisi {
            tfkisiad.text = _kisi.kisi_ad
            tfkisitel.text = _kisi.kisi_tel
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnguncelle(_ sender: Any) {
        if let ka = tfkisiad.text ,let  kt = tfkisitel.text, let k = kisi {
            kisidetaypresenternesnesi?.guncelle(kisiId: Int(k.kisi_id!)!, kisiAd: ka, kisiTel: kt)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
