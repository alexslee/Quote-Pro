//
//  FormattedQuoteView.swift
//  Quote Pro
//
//  Created by Alex Lee on 2017-07-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit

class FormattedQuoteView: UIView {

    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var quoteAuthor: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func formatQuote(quote:Quote) {
        guard let imageData = quote.image else {
            quoteImage.image = UIImage(named: "placeholder")
            quoteLabel.text = quote.quoteText ?? ""
            quoteAuthor.text = quote.quoteAuthor ?? ""
            return
        }
        quoteImage.image = UIImage(data: imageData)
        quoteLabel.text = quote.quoteText ?? ""
        quoteAuthor.text = quote.quoteAuthor ?? ""
    }

}
