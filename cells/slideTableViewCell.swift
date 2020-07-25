//
//  slideTableViewCell.swift
//  COI
//
//  Created by prashant dilip thakare on 15/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit

class slideTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lblref: UIImageView!
    
    @IBOutlet weak var imgOut: UIImageView!
    @IBOutlet weak var lblOut: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
