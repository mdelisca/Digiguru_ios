//
//  InstructorTableViewCell.swift
//  Digiguru
//
//  Created by Macbook Air on 8/5/21.
//

import UIKit

class InstructorTableViewCell: UITableViewCell {

    @IBOutlet weak var imageinstructor: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var imagerating: UIImageView!
    
    @IBOutlet weak var lblRating: UILabel!
    
    @IBOutlet weak var lblreviews: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
