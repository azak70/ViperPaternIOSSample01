//
//  KisiKayitVC.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 30.05.2023.
//

import UIKit

class KisiKayitVC: UIViewController {
    var kisikayitPresenterNesnesi:ViewToPresenterKisiKayitProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        KisiKayitRouter.createModule(ref: self)
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var tfkisiad: UITextField!
    
    @IBOutlet weak var tfkisitel: UITextField!
    
    
    @IBAction func kaydet(_ sender: Any) {
        if let ka = tfkisiad.text, let kt = tfkisitel.text {
            kisikayitPresenterNesnesi?.kisiEkle(kisiAd: ka, kisiTel: kt)
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

