//
//  ReviewsTableViewCell.swift
//  Digiguru
//
//  Created by Macbook Air on 8/5/21.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageReview: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    
    @IBOutlet weak var imageRating: UIImageView!
    
    @IBOutlet weak var lblrating: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblreviewText: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
