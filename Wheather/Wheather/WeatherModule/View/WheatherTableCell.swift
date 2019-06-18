//
//  WheatherTableCell.swift
//  Wheather
//
//  Created by admin on 16/06/2019.
//  Copyright © 2019 11Street. All rights reserved.
//

import UIKit

class WheatherTableCell: UITableViewCell {

    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
