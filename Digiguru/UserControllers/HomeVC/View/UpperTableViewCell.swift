//
//  UpperTableViewCell.swift
//  Digiguru
//
//  Created by Macbook Air on 8/4/21.
//

import UIKit

class UpperTableViewCell: UITableViewCell {

    @IBOutlet weak var searchTF: UITextField!
    
    @IBOutlet weak var filterBtn: UIButton!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var lblrewardsPoint: UILabel!
    
    @IBOutlet weak var lbluserName: UILabel!
    
    @IBOutlet weak var lblno_of_routine: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
