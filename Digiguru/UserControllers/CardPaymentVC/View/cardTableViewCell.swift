//
//  cardTableViewCell.swift
//  Digiguru
//
//  Created by Macbook Air on 8/5/21.
//

import UIKit

class cardTableViewCell: UITableViewCell {

    @IBOutlet weak var imagecard: UIImageView!
    @IBOutlet weak var checkBTn: UIButton!
    
    @IBOutlet weak var lblname: UILabel!
    
    @IBOutlet weak var lblNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
