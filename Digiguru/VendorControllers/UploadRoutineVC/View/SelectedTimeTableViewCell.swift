//
//  SelectedTimeTableViewCell.swift
//  DigiguruVendor
//
//  Created by Macbook Air on 8/7/21.
//

import UIKit

class SelectedTimeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var starttimeTF: UITextField!
    
    @IBOutlet weak var ButtonAddOrRemove: UIButton!
    
    @IBOutlet weak var endTimeTF: UITextField!
    
    @IBOutlet weak var imagebtn: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
