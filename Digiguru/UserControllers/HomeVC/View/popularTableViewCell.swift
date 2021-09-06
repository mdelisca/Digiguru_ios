//
//  popularTableViewCell.swift
//  Digiguru
//
//  Created by Macbook Air on 8/6/21.
//

import UIKit

class popularTableViewCell: UITableViewCell {

    
    @IBOutlet weak var viewallBt: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
