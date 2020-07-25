//
//  scheduleTableViewCell.swift
//  COI
//
//  Created by prashant thakare on 18/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit

class scheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblO: UILabel!
    @IBOutlet weak var imgv: UIImageView!
    
    @IBOutlet weak var chakraImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
