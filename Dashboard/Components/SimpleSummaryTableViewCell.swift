//
//  SimpleSummaryTableViewCell.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/28/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit

class SimpleSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var statusArrow: Triangle!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
