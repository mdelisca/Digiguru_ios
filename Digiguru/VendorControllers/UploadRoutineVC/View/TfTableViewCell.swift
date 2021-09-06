//
//  TfTableViewCell.swift
//  DigiguruVendor
//
//  Created by Macbook Air on 8/7/21.
//

import UIKit

class TfTableViewCell: UITableViewCell {

    @IBOutlet weak var DataTf: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
