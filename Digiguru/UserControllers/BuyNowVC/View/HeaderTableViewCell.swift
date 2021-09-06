//
//  HeaderTableViewCell.swift
//  Digiguru
//
//  Created by Macbook Air on 8/5/21.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var favbTn: UIButton!
    
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var lblLesson: UILabel!
    
    @IBOutlet weak var imageStar: UIImageView!
    
    @IBOutlet weak var Lblrating: UILabel!
    
    @IBOutlet weak var lblreview: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var Imagebackgnd: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
