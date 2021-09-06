//
//  rewardsTableViewCell.swift
//  Digiguru
//
//  Created by Macbook Air on 8/4/21.
//

import UIKit

class rewardsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSection: UILabel!
    
    @IBOutlet weak var viewallBtn: UIButton!
    
    @IBOutlet weak var rewardCollectionView: UICollectionView!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
