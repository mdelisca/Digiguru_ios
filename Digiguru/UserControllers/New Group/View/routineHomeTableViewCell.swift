//
//  routineHomeTableViewCell.swift
//  Digiguru
//
//  Created by Macbook Air on 8/5/21.
//

import UIKit

class routineHomeTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var lblrating: UILabel!
    
    @IBOutlet weak var ratingIcon: UIImageView!
    
    @IBOutlet weak var imageicon: UIImageView!
    
    @IBOutlet weak var lblTpye: UILabel!
    
    @IBOutlet weak var lblpoints: UILabel!
    
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var favBtn: UIButton!
    
    @IBOutlet weak var lblprice: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
