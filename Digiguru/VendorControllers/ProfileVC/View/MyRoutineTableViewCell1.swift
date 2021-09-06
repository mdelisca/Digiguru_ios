//
//  MyRoutineTableViewCell1.swift
//  DigiguruVendor
//
//  Created by Buzzware Tech on 07/08/2021.
//

import UIKit

class MyRoutineTableViewCell1: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblNAme: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var btnNext: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
