//
//  KisiTableViewCell.swift
//  UDM-KisilerAppViperDsgn
//
//  Created by ahmet azak on 3.06.2023.
//

import UIKit

class KisiTableViewCell: UITableViewCell {

    @IBOutlet weak var lbtel: UILabel!
    @IBOutlet weak var lbadsoyad: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
