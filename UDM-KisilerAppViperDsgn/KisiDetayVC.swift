//
//  KisiDetayVC.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 30.05.2023.
//

import UIKit

class KisiDetayVC: UIViewController {

    @IBOutlet weak var tfkisiad: UITextField!
    @IBOutlet weak var tfkisitel: UITextField!
    var kisi:Kisiler?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let _kisi = kisi {
            tfkisiad.text = _kisi.KisiAd
            tfkisitel.text = _kisi.KisiTel
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnguncelle(_ sender: Any) {
        if let ka = tfkisiad.text ,let  kt = tfkisitel.text, let k = kisi {
            guncelle(kisiid: k.KisiId, kisiad: ka, kisitel: kt)
        }
    }
    func guncelle(kisiid:Int,kisiad:String,kisitel:String){
        print ("Kisi Guncelle  id = \(kisiid) ad : \(kisiad) tel : \(kisitel)");
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
