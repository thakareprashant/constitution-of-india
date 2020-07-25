//
//  amendmentsTableViewCell.swift
//  COI
//
//  Created by prashant thakare on 19/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit

class amendmentsTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var logoImg: UIImageView!
    
    @IBOutlet weak var lblAmend: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
