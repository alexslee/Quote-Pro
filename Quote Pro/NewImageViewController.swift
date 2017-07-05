//
//  NewImageViewController.swift
//  Quote Pro
//
//  Created by Alex Lee on 2017-07-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit
import RealmSwift

class NewImageViewController: UIViewController {
    
    // MARK: properties
    
    @IBOutlet weak var showFormattedQuoteView: UIView!
    
    var quotePreview:FormattedQuoteView!
    
    var quoteGetter: ForismaticController!
    
    var imageGetter: LoremPixelController!
    
    var newQuote: Quote!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize properties + the quote preview view
        quoteGetter = ForismaticController()
        imageGetter = LoremPixelController()
        quotePreview = Bundle.main.loadNibNamed("FormattedQuoteView", owner: nil, options: nil)?.first as? FormattedQuoteView
        quotePreview?.frame.size = showFormattedQuoteView.frame.size
        showFormattedQuoteView.addSubview(quotePreview)
        newQuote = Quote()
        reloadQuotePreview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func reloadQuotePreview() {
        //reload the preview asynchronously on the main thread
        DispatchQueue.main.async {
            self.quotePreview.formatQuote(quote: self.newQuote)
        }
    }
    
    // MARK: actions
    
    @IBAction func getQuotePressed(_ sender: Any) {
        //get a quote from Forismatic, and set the labels in the quote preview if successful
        quoteGetter.generateQuote(completionHandler: {
            (quote:String, author:String) in
            self.newQuote.quoteText = quote
            self.newQuote.quoteAuthor = author
            self.reloadQuotePreview()
        })
    }
    
    @IBAction func getImagePressed(_ sender: Any) {
        //get an image from LoremPixel, and set the image in the quote preview if successful
        imageGetter.generateImage(completionHandler: {
            (image:UIImage) in
            self.newQuote.image = UIImageJPEGRepresentation(image, 1.0)
            self.reloadQuotePreview()
        })
    }
    
    @IBAction func savePressed(_ sender: Any) {
        //save the quote to realm, will be loaded in the main table view controller
        let realm = try! Realm()
        try! realm.write {
            realm.add(self.newQuote)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelPressed(_ sender: Any) {
        //return to the main table view controller
        self.dismiss(animated: true, completion: nil)
    }
}
