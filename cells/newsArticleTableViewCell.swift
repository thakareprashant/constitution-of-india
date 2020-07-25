//
//  newsArticleTableViewCell.swift
//  COI
//
//  Created by prashant thakare on 20/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit

class newsArticleTableViewCell: UITableViewCell {
    var dateL = ""
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsAlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let date = UILabel(frame: CGRect(x: 300, y: 20, width: 100, height: 50))
       date.text = dateL
            date.textColor = UIColor.red
        self.addSubview(date)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
