//
//  RoutineTableViewCell.swift
//  Digiguru
//
//  Created by Macbook Air on 8/4/21.
//

import UIKit

class RoutineTableViewCell: UITableViewCell {

    
    @IBOutlet weak var routineCollectionView: UICollectionView!
    
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
