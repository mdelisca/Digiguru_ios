//
//  RoutinessTableViewCell.swift
//  DigiguruVendor
//
//  Created by Macbook Air on 8/6/21.
//

import UIKit

class RoutinessTableViewCell: UITableViewCell {

    @IBOutlet weak var lbltotal: UILabel!
    
    @IBOutlet weak var progressbaar: UIProgressView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
