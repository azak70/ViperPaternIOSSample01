//
//  KisiKayitVC.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 30.05.2023.
//

import UIKit

class KisiKayitVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var tfkisiad: UITextField!
    
    @IBOutlet weak var tfkisitel: UITextField!
    
    
    @IBAction func kaydet(_ sender: Any) {
        if let ka = tfkisiad.text, let kt = tfkisitel.text {
        kisikaydet(ad: ka, tel: kt)
    }
    }
    func kisikaydet(ad:String,tel:String){
        print("Kisi Ad:\(ad)- tel : \(tel)")
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

