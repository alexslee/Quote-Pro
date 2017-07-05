//
//  QuoteProTableViewCell.swift
//  Quote Pro
//
//  Created by Alex Lee on 2017-07-04.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit

class QuoteProTableViewCell: UITableViewCell {

    @IBOutlet weak var quoteImage: UIImageView!
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
